# retrieve stats on each player that has logged onto minecraft server

'''
    TODO:
    - create dataframe containing server stats
    - create dataframe containing player stats
        - total users w/ names -> usercache.json -> create cross ref. with UUID
        - grab all stats for each player from stats
        - grab all advancements / achievements from advancements
        - add in who is OP

    LONGTERM:
    - create minecraft story book from every message said in chat -> similar to group chat

    ?? .dat files ?? - what's in backpack ??
'''

import pandas as pd

# will create csv from stats jsons and return csv
def CreateCSV(dir_to_usercache, dir_to_jsons):
    # imports usercache.json to df
    usercache = pd.read_json(dir_to_usercache)

    # creating a df for each user
    for element in range(len(usercache.index)):
        # creating df for the user
        usercache.loc[:, 'name'][element] = pd.read_json(dir_to_jsons + usercache.loc[:, 'uuid'][element] + '.json')

        # setting caption to the owner of the stats
        usercache.loc[:, 'name'][element].style.set_caption(usercache.loc[:, 'name'][element])


# will take outputted csv and upload to google sheets for all to view
def GoogleUpload():
    pass

if __name__ == '__main__':
    dir_to_usercache = '~/PythonProjects/MinecraftStats/proj/jsons/usercache.json'
    dir_to_jsons = '~/PythonProjects/MinecraftStats/proj/jsons/stats/'
    CreateCSV(dir_to_usercache, dir_to_jsons)
