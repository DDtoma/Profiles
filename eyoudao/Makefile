xslt:xslt.c
	gcc -o xslt xslt.c `xslt-config --cflags --libs`

install:
	mkdir /opt/eyoudao
	cp -r ./* /opt/eyoudao
	chmod -R 775 /opt/eyoudao
	ln -fs /opt/eyoudao/eyoudao /usr/bin/eyoudao

uninstall:
	rm -f /usr/bin/eyoudao
	rm -rf /opt/eyoudao
	
