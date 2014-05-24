build:
	./bin/middleman build

upload:
	./bin/middleman s3_sync

setup_s3:
	aws s3api put-bucket-policy \
	  --bucket blog.tmtk.net \
	  --policy file://`pwd`/etc/s3-bucket-policy.json 
