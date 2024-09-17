import json

with open('points.json') as f:
    d = json.load(f)

    lookup = "#define lookup {"
    for key in d.keys():
        lookup += "" + key.replace("-","_")+","
    print(lookup[:-1]+"}\n")
    
    for key in d.keys():
        converted = "uint32_t " + str(key).replace("-", "_") + "[51] = {"
        src = d[key]
        for i in range(0, 51):
            chunk = src[i*8 : ((i+1)*8)-1]
            converted += "0x" + chunk + ","
        converted = converted[:-1] + "};"
        print(converted)