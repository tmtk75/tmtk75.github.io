upload:
	./bin/middleman build
	./bin/middleman s3_sync

setup_s3:
	aws s3api put-bucket-policy \
	  --bucket blog.tmtk.net \
	  --policy file://`pwd`/policy.json 
	aws s3 website s3://blog.tmtk.net \
	  --index-document index.html \
	  --error-document 404.html
