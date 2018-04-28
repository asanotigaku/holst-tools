# google documentのダウンロードスクリプト(注意:python2)
GDOCDL		= gdoc-downloader
GDOCDL_REPO	= https://github.com/uid/$(GDOCDL)

-include config # 設定が存在すれば読み込む

default: $(GDOCDL)
	@echo "hello"

$(GDOCDL):
	git clone $(GDOCDL_REPO)
