import re
import os

# Define paths for the files
zygor_file = "ZygorLevelingHordeCLASSIC.lua"
restedxp_output_base = "zygorConverted/"

# Ensure base output directory exists
os.makedirs(restedxp_output_base, exist_ok=True)

# Function to sanitize filenames for Windows
def sanitize_filename(name):
    return re.sub(r'[<>:"/\\|?*\n]', '_', name)[:100]

# Function to extract quest-related data from lines
def extract_quest_data(line):
    """
    Extract quest ID and objectives from a line.
    """
    quest_id = None
    objective = None
    quest_name = None

    # Extract quest ID and objective from "|q <quest_id>/<objective>"
    quest_match = re.search(r'\|q (\d+)(?:/(\d+))?', line)
    if quest_match:
        quest_id = quest_match.group(1)
        objective = quest_match.group(2)  # Keep objective None if not present
    else:
        # Fallback: Extract quest ID and name from "quest_name##<quest_id>"
        quest_match = re.search(r'([^#]+)##(\d+)', line)
        if quest_match:
            quest_name = quest_match.group(1).strip()
            quest_id = quest_match.group(2)

    return quest_id, objective, quest_name

# Class-specific condition keywords
class_conditions = [
    "|only if Paladin",
    "|only if Warrior",
    "|only if Rogue",
    "|only if Priest",
    "|only if Warlock",
    "|only if Mage",
    "|only if Shaman",
    "|only if Druid",
    "|only if Hunter",
]

# Read the Zygor file
with open(zygor_file, 'r') as file:
    zygor_data = file.read()

# Match guide headers and their associated steps
guide_pattern = re.compile(r'ZygorGuidesViewer:RegisterGuide\("Leveling Guides\\\\(.*?) \((\d+-\d+)\)",.*?},\[\[\n(.*?)\]\]', re.DOTALL)
guides = guide_pattern.findall(zygor_data)

if not guides:
    print("No guides found. Ensure the input file structure is correct.")
    exit()

for guide in guides:
    zone, level_range, steps = guide
    zone_name = sanitize_filename(f"({level_range})_{zone}")

    if "Startup Guide" in zone:
        print(f"Skipping unsupported guide: {zone_name}")
        continue

    # RestedXP output header
    restedxp_steps = [
        "StartMobAvoidance();",
        "UseDBToRepair(true);",
        "UseDBToSell(true);",
        "SetQuestRepairAt(30);",
        "SetQuestSellAt(2);",
        "IgnoreLowLevelQuests(false);",
        ""
    ]

    # Process lines with logic for class-specific skipping
    lines = steps.split("\n")
    skip_class_specific = False

    for i, line in enumerate(lines):
        line = line.strip()
        if not line:
            continue

        # Check if the current line contains class-specific conditions or SoD conditions
        if any(condition in line for condition in class_conditions) or "ZGV.IsClassicSoD" in line:
            print(f"Skipping class-specific or SoD line: {line}")
            continue

        # Check if the next line is class-specific or SoD
        next_line = lines[i + 1].strip() if i + 1 < len(lines) else ""
        if any(condition in next_line for condition in class_conditions) or "ZGV.IsClassicSoD" in next_line:
            print(f"Skipping class-specific or SoD block due to condition: {next_line}")
            skip_class_specific = True
            continue

        # Exit class-specific skipping mode once unrelated lines are encountered
        if skip_class_specific:
            if not any(keyword in line.lower() for keyword in ["accept", "turnin", "click", "kill", "collect", "|q"]):
                skip_class_specific = False
            else:
                print(f"Skipping line within class-specific block: {line}")
                continue

        # Skip vendor or flight path lines
        if "vendor" in line.lower() or "fpath" in line.lower() or line.lower().startswith("talk "):
            print(f"Skipping line due to vendor or flight path: {line}")
            continue

        # Debug: Log the current line
        print(f"Processing line: {line}")

        # Extract quest data
        quest_id, objective, quest_name = extract_quest_data(line)

        # Handle quest-related actions
        if "accept" in line.lower() and quest_id:
            comment = f" -- {quest_name}" if quest_name else ""
            restedxp_steps.append(f"AcceptQuestUsingDB({quest_id});{comment}")
            # Only add `CompleteObjectiveOfQuest` if a valid objective exists
            if objective:
                restedxp_steps.append(f"CompleteObjectiveOfQuest({quest_id},{objective});")
        elif "turnin" in line.lower() and quest_id:
            restedxp_steps.append(f"TurnInQuestUsingDB({quest_id});")
        elif ("kill" in line.lower() or "collect" in line.lower() or "|q" in line) and quest_id and objective:
            restedxp_steps.append(f"---- Obj Debug ---- .complete {quest_id},{objective}")
            restedxp_steps.append(f"CompleteObjectiveOfQuest({quest_id},{objective});")

    # Add StopQuestProfile(); to the end of the file
    restedxp_steps.append("StopQuestProfile();")

    # Write the processed steps to a file
    if len(restedxp_steps) > 8:  # Header counts as 7 lines, +1 for StopQuestProfile()
        restedxp_file_path = os.path.join(restedxp_output_base, f"{zone_name}.lua")
        with open(restedxp_file_path, 'w') as restedxp_file:
            restedxp_file.write("\n".join(restedxp_steps))
    else:
        print(f"No valid quest steps found for zone: {zone_name}")

print(f"Conversion complete. Files saved to {restedxp_output_base}")
