import sys

if __name__ == '__main__':
   if len(sys.argv) == 2:
      cam_id = int(sys.argv[1])
      print("camd_id = %2s" % cam_id)
