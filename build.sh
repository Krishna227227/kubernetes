#! /bin/bash
cd Gold_Site_Ecommerce
sudo git pull
sudo docker build -t raja -f golddockerfile .
sudo docker tag raja:latest rajapvk23/dev:h1
sudo docker push rajapvk23/dev:h1
