#!/bin/python3
def main():
    import os
    import subprocess
    for root, dirs, files in os.walk('lib'):
        for filename in files:
            if(filename.endswith('.g4')):
                subprocess.run(['antlr4', '-Dlanguage=Dart',filename],cwd=root)
        

if __name__ == "__main__":
    main()