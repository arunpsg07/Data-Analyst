from selenium import webdriver
import time
import os

driver_file = os.getcwd() + "\\chromedriver.exe"
driver = webdriver.Chrome(driver_file)

link = r"https://www.psgcas.ac.in/academics_faculty_directory.html"

driver.get(link)

content = driver.find_elements_by_class_name('media')

print(content)

time.sleep(5)

driver.close()