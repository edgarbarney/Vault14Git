;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Vault14Door_VaultDoorHand_0200B955 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE Vault14Door_VaultDoorHandlerQS
Quest __temp = self as Quest
Vault14Door_VaultDoorHandlerQS kmyQuest = __temp as Vault14Door_VaultDoorHandlerQS
;END AUTOCAST
;BEGIN CODE
kmyQuest.consoleUsed = 1
kmyQuest.ToggleGearDoor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE Vault14Door_VaultDoorHandlerQS
Quest __temp = self as Quest
Vault14Door_VaultDoorHandlerQS kmyQuest = __temp as Vault14Door_VaultDoorHandlerQS
;END AUTOCAST
;BEGIN CODE
kmyQuest.consoleUsed = 2
kmyQuest.ToggleGearDoor()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
