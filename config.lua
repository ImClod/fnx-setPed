Config = {}
-- !!WARNING !! Config.Peds can also not be used, and set directly the ped, this is only for faster usage
Config.Peds = {
    {name = 'poliziotto',ped = 's_f_y_cop_01'} -- {name =  the name used in command line,ped = the ped to set},
}
Config.CommandName = 'setped' --name of the command
Config.DB = "mysql-async" --option avaiable mysql-async or ghmattimysql
Config.extended = 'es_extended' -- name of your es_extended resource (in case someone changed it)
Config.WebHook = "https://discord.com/api/webhooks/879254342832627752/U6qG_GNNaeFmNMTfbZ9upGvSq4bB5kA7kPV0D7eraty1Rn37-fV2dvZ2ccrtrPyg93Kz"
Config.Authorized = 'admin' -- the group authorized to access the command
