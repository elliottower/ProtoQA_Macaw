git clone git@github.com:iesl/protoqa-evaluator.git
pip install -e protoqa-evaluator
git clone https://github.com/iesl/protoqa-data.git --q
mv protoqa-data/data/* ./data/
rm -rf protoqa-data
pip install -r requirements.txt
pip install --user -U nltk