
lib.locale()

-- Funciones para el Rockstar Editor
local function startRecording()
    StartRecording(1)
    lib.notify({
        title = locale('notify_record_title'),
        description = locale('notify_record_description'),
        type = 'info'
    })
end

local function saveClip()
    StartRecording(0)
    StopRecordingAndSaveClip()
    lib.notify({
        title = locale('notify_save_title'),
        description = locale('notify_save_description'),
        type = 'success'
    })
end

local function deleteClip()
    StopRecordingAndDiscardClip()
    lib.notify({
        title = locale('notify_delete_title'),
        description = locale('notify_delete_description'),
        type = 'error'
    })
end

local function openEditor()
    lib.notify({
        title = locale('notify_editor_title'),
        description = locale('notify_editor_description'),
        type = 'info'
    })
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
end


local actions = {
    record = startRecording,
    saveclip = saveClip,
    delclip = deleteClip,
    editor = openEditor
}

lib.registerMenu({
    id = 'rockstar_editor_menu',
    title = locale('menu_title'),
    position = 'bottom-left',
    options = {
        {
            label = locale('menu_record_title'),
            icon = 'fa-solid fa-video',
            description = locale('menu_record_description'),
            args = {action = 'record'}
        },
        {
            label = locale('menu_save_title'),
            icon = "fa-solid fa-floppy-disk",
            description = locale('menu_save_description'),
            args = {action = 'saveclip'}
        },
        {
            label = locale('menu_delete_title'), 
            icon = "fa-solid fa-trash-can",
            description = locale('menu_delete_description'),
            args = {action = 'delclip'}
        },
        {
            label = locale('menu_editor_title'),
            icon = "fa-solid fa-circle-play",
            description = locale('menu_editor_description'),
            args = {action = 'editor'}
        }
    },
    onClose = function(keyPressed)
        if keyPressed then
            print(locale('menu_closed', keyPressed))
        end
    end
}, function(selected, scrollIndex, args)
    if args.action and actions[args.action] then
        actions[args.action]()
    end
end)

-- Comando para abrir el menú
RegisterCommand(Config.command, function()
    lib.showMenu('rockstar_editor_menu')
end, false)