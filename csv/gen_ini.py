try:
    from configparser import ConfigParser
except ImportError:
    from ConfigParser import ConfigParser  # ver. < 3.0

# instantiate
config = ConfigParser()


# add a new section and some values
config.add_section('section_b')
config.set('section_b', 'meal_val', 'spam')
config.set('section_b', 'not_found_val', 404)

# save to a file
with open('test_update.ini', 'w') as configfile:
    config.write(configfile)
