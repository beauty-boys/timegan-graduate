### 文件及文件夹说明
1. ./data 用于存放训练所需的数据集 
   1. 全疆电力负荷 来源于新疆电力公司
   2. ETTdataset 来源于[电力变压器数据集 (ETDataset)](https://github.com/zhouhaoyi/ETDataset/blob/main/README_CN.md)
   3. PortugalDataset 来源于[葡萄牙家庭用电负荷](https://archive.ics.uci.edu/dataset/374/appliances+energy+prediction)
2. ./log 用于存放训练中所的日志文件
3. ./metrics 用于存放
4. ./plots 用于存放
5. ./result 用于存放
6. ./script 用于存放可执行的脚本文件
7. ./timegan_final 用于存放保存的模型
8. 当前目录下文件 
   1. main_timegan.py  程序执行的执行的主入口
      - **data_name** 数据集名：可选参数 `['sine','stock','energy','ETTh1', 'ETTh2', 'ETTm1', 'ETTm2']`
      - **seq_len** 序列长度 
      - **module** 模型结构可选 `['gru','lstm','lstmLN']`
      - **hidden_dim**
      - **num_layer**
      - **iteration**
      - **batch_size**
      - **metric_iteration**
      - **save_dir**
   2. load_model.py
   3. timegan.py 用于定义模型结构以及损失函数
   4. data_loading.py 加载训练数据
   5. utils.py 工具类函数
      - 数据集划分，会先将数据集打乱，idx = np.random.permutation(no) ,再根据8:2的比例划分训练集和测试集
      - extract_time(data) 提取每条序列长度和 最大序列长度 -> 支持变长序列，方便 padding、mask 或动态展开。
      - RNN 单元 创建RNN时序单元。
      - random_generator用于生成随机噪声：生成0-1的均匀分布的随机采样 `[T_mb[i], z_dim]`
      - batch_generator 这个函数用来每次训练时随机抽一个 mini-batch
   6. requirements.txt python所依赖的环境