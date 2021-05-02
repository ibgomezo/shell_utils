# Shell utilities
A serie of usefull bash scripts for different tasks.

## Properties file manager
Simplify the properties files managment. Could be included using:
> source *path_to_property_manager_script*

Read a property file:
> readProperties *path_to_property_file*

Read a variable in the property file:
> getProperty *name_of_property*

Write a property (if the property exist, then override it, else create a new one):
> setProperty *name* *value*
