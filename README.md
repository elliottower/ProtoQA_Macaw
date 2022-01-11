# ProtoQA-Macaw Baseline

This repo contains a baseline of Allenai's [Macaw](https://github.com/allenai/macaw) model for use with the ProtoQA dataset ([EMNLP paper](https://www.aclweb.org/anthology/2020.emnlp-main.85.pdf))
- The dataset is here: [https://github.com/iesl/protoqa-data](https://github.com/iesl/protoqa-data)
- The proposed evaluation is here: [https://github.com/iesl/protoqa-evaluator](https://github.com/iesl/protoqa-evaluator)
- The GPT2 baseline is here: [https://github.com/iesl/ProtoQA_GPT2](https://github.com/iesl/ProtoQA_GPT2)

## Requirments
- Pytorch: 1.4.0
- Huggingface transformer: 2.1.1

Following the install.sh in the repo will create a conda environment named protoqa, with corresponding libraries installed. Note: protoqa-evaluater is included. 

## Download fine-tuned Macaw model and generate answers
Colab notebook demo: [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/elliottower/ProtoQA_GPT2/blob/main/GPT2_demo.ipynb)

- Fine-tuned model can be downloaded [here](https://drive.google.com/file/d/1HmwcYbuUe0EQN0a2mOnv68pv3w-6Kivn/view?usp=sharing)
- Generate answers using the fine-tuned Macaw model:
```bash
python run_generation.py \
--model_type=macaw \
--model_name_or_path='allenai/macaw-large' \
--length=10 \
--num_samples=300 \
--temperature=0.69 \
--input_file='./data/dev/dev.crowdsourced.jsonl \
--output='./'
```

This will generate ranked_answer.jsonl under the same directionary. 
- Run protoqa-evaluator to evaluate against ground truth answers, for example:
```bash
protoqa_evaluator evaluate --similarity_function exact_match ./data/dev/dev.crowdsourced.jsonl ranked_list.jsonl
```
- For detail usage of protoqa-evaluator, please refer to https://github.com/iesl/protoqa-evaluator

## Fine tune model
- Use the train/dev in the data directory. The train/dev data are from ProtoQA scrapped data. 
- Run finetune.sh to fine tune the Macaw model. 
