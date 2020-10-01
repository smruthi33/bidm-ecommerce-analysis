#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[2]:


orders = pd.read_csv("./orders.csv")
orders.head()


# In[3]:


products=pd.read_csv("./products.csv")
products.head()


# In[5]:


products


# In[6]:


aisle = pd.read_csv("./aisles.csv")
dept=pd.read_csv("./departments.csv")


# In[7]:


prod_final=products.merge(aisle, on="aisle_id")


# In[8]:


prod_final


# In[9]:


del prod_final["aisle_id"]


# In[10]:


prod_final=prod_final.merge(dept, on="department_id")
del prod_final["department_id"]
prod_final.head()


# In[11]:


prod_final


# In[24]:


order_prior=pd.read_csv("order_products__prior.csv")
#order_train=pd.read_csv("order_products__train.csv")
order_prior


# In[51]:


order_list=order_prior.merge(prod_final, on="product_id", how="left")


# In[52]:


order_list


# In[53]:


order_list=order_list.sample(frac=.04)
order_list


# In[54]:


order_list['reordered'].value_counts()


# In[56]:


order_list.to_csv("./training_data.csv", index=False)


# In[ ]:




