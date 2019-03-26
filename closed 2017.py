
# coding: utf-8

# In[67]:


import pandas as pd
import numpy as np 

school = pd.read_csv("2017_data.csv")    


# In[68]:


new = pd.concat([school["INSTNM"], school["DEATHYR"]], axis=1)
new.head()


        
index = new[new["DEATHYR"]!=-2].index.tolist()
closed = new["INSTNM"][index]
closed_list = closed.tolist()


# In[69]:


closed_list

