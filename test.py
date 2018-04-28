import sys
sys.path.append("./gdoc-downloader")
from gdoc2latex import download_to_file

url = "https://docs.google.com/document/d/なんたらかんたら/edit"
filename = "test.md"

download_to_file(url, filename);
