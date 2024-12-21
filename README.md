[TOC]

## 1、现有效果简单介绍

### （1）衣物种类检测

​	现有模型会检测图片或视频中的反光衣、安全帽和人，并将检测出结果用不同颜色的长方形框框出。

### （2）依据逻辑输出判定结果

​	在图片或视频左上角根据检测到的衣服种类输出特定文本：

​		若检测到的反光衣数量、人数、安全帽的数量匹配，会输出“所有人穿戴反光衣和安全帽”

​		否则，输出“有人未穿戴反光衣或安全帽”

## 2、环境配置

本部分的核心内容已内嵌入run.sh这一执行脚本，只需要完成以下两部分内容即可

### 创建虚拟环境

为了避免软件环境的矛盾，需要新建一个虚拟环境并进入

### 安装中文字体

把reflective_detect目录下的“simsun.ttf”和"simsun.ttc"复制到以下路径：`/usr/share/fonts/`

## 3、代码运行

在任何路径下运行下面的指令即可

```bash
bash path2reflectibe_ditect/run.sh
```

注：如需更改输入路径：可以为上述命令添加参数，如：`bash run.sh test.jpg`

## 4、代码修改

### （1）判定逻辑修改

​	修改部分为detect.py的271～274行：

```python
if hat_num>=person_num and ref_num>=person_num:
  result_flag=0
else:
  result_flag=1
```

​	按照新逻辑修改判断条件即可

### （2）修改根据判定结果得到的后续操作

​	修改部分为detect.py的253～262行:

```python
if result_flag==0:
  vest_result="所有人穿戴反光衣和安全帽"
elif result_flag==1:
  vest_result="有人未穿戴反光衣或安全帽"


if(seen%out_freq==0):
  with open('output.txt','a') as f:
    import sys
    sys.stdout=f
    print(vest_result)
    sys.stdout=sys.__stdout__

vest_position = (10, 50)  # 文本的位置
color = (0, 0, 255)  
annotator.text(vest_position,vest_result, color)
```

​	修改不同条件下所需进行的操作即可