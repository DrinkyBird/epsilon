from PIL import Image, ImageFile
import sys

ImageFile.LOAD_TRUNCATED_IMAGES = True

mapfrom = [
    (127, 255, 224),
    (63, 255, 216),
    (0, 255, 208),
    (0, 234, 191),
    (0, 213, 173),
    (0, 191, 156),
    (0, 170, 139),
    (0, 149, 121),
    (0, 128, 104),
    (0, 106, 87),
    (0, 85, 69),
    (0, 64, 52),
    (0, 52, 42),
    (0, 39, 31),
    (0, 26, 20),
    (0, 14, 10),
    (116, 174, 255)
]

mapto = [
    (213, 255, 146),
    (193, 255, 103),
    (169, 255, 69),
    (150, 236, 56),
    (132, 215, 51),
    (116, 192, 49),
    (97, 171, 35),
    (78, 150, 26),
    (59, 129, 19),
    (41, 106, 13),
    (23, 85, 8),
    (6, 64, 6),
    (8, 50, 8),
    (7, 36, 7),
    (5, 22, 5),
    (2, 8, 2),
    (169, 255, 69)
]

def add_alpha(list):
    for i in range(len(list)):
        r, g, b = list[i]
        list[i] = (r, g, b, 255)
        
add_alpha(mapfrom)
add_alpha(mapto)

img = Image.open(sys.argv[1])
img = img.convert("RGBA")

data = img.load()

for y in range(img.size[1]):
    for x in range(img.size[0]):
        px = data[x, y]
        try:
            i = mapfrom.index(px)
            if i == 16:
                data[x, y] = (0,0,0,0)
            else:
                data[x, y] = mapto[i]
        except ValueError:
            pass
        except Exception:
            raise
            
img.save(sys.argv[1])