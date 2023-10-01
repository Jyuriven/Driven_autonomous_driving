#!/usr/bin/python3
#-*- coding:utf-8 -*-

import detect
import torch

with torch.no_grad():
    for e,s in detect.run():
        print(e,s)
