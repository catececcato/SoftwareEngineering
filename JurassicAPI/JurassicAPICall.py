#!/usr/bin/env python
# coding: utf-8

# In[55]:


import requests
import json

new =requests.post(
    "https://api.ai21.com/studio/v1/j1-jumbo/complete",
    headers={"Authorization": "Bearer vc7KLlGzEjqrbyKuJ5lmJXejJCeBVfE2"},
    json={
        "prompt": "What is the animated film with a panda called?", 
        "numResults": 1, 
        "maxTokens": 8, 
        "stopSequences": ["."],
        "topKReturn": 0,
        "temperature": 0.0
    }
)

data = new.json()

for a in data["completions"]:
    newdata = a

    
print(newdata["data"]["text"])

