export image="gdfuse"
export version="latest"
#npm run linux
docker build -t registry.cn-beijing.aliyuncs.com/edgora-oss/$image:$version --no-cache  -f Dockerfile .

docker push  registry.cn-beijing.aliyuncs.com/edgora-oss/$image:$version

docker tag  registry.cn-beijing.aliyuncs.com/edgora-oss/$image:$version  edgora/$image:$version
docker push edgora/$image:$version
