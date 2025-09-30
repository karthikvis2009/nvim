import os
import subprocess

# Get environment variables
foam_tutorials = os.environ.get("FOAM_TUTORIALS")
filename = "controlDict"

if not foam_tutorials or not filename:
    raise RuntimeError("FOAM_TUTORIALS or FILENAME not set in environment")

cmd = ["find", foam_tutorials, "-type", "f", "-name", filename]
result = subprocess.run(cmd, text=True, capture_output=True)

files_list = result.stdout.strip().splitlines()

keywords_list = []

for file in files_list:

    cmd = ["foamDictionary", file, "-keywords"]
    result = subprocess.run(cmd, text=True, capture_output=True).stdout.strip().split("\n")

    for res in result:
        if res not in keywords_list:
            if res.isalpha():
                keywords_list.append(res)

remove_keywords = ["FoamFile", "libs"]
for rem in remove_keywords:
    try:
        keywords_list.remove(rem)
    except:
        pass


# cmd = ["foamSearch $FOAM_TUTORIALS application controlDict | awk '{print $NF}' | sed 's/;$//'"]
# result = subprocess.run(cmd, text=True, capture_output=True, shell = True).stdout.strip().split("\n")

print(keywords_list)

# cmpKind = "vim.lsp.protocol.CompletionItemKind.EnumMember"
# with open("./controlDict.lua", 'w') as file:
#     file.write("return {\n")

#     for kw in keywords_list:
#         file.write(f"{kw} = {{ \n")
#         cmd = [f"foamSearch $FOAM_TUTORIALS {kw} controlDict | awk '{{print $NF}}' | sed 's/;$//'"]
#         result = subprocess.run(cmd, text=True, capture_output=True, shell = True).stdout.strip().split("\n")
#         for res in result:
#             file.write(f'{{label = "{res}", kind = {cmpKind}}},')
#         file.write("\n},\n")

#     file.write("}\n")
