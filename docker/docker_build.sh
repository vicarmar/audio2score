cp ../requirements.txt ./requirements.txt
cp ../setup.py ./setup.py 
cp -R ../src ./src
docker build -t audio2score -f audio2score.Dockerfile --build-arg cleancache=$(date +%s) .

rm ./requirements.txt
rm ./setup.py
rm -Rf ./src