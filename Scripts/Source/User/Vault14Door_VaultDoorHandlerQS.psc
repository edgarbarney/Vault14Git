Scriptname Vault14Door_VaultDoorHandlerQS extends Quest

RefCollectionAlias Property KlaxonLights Auto

ReferenceAlias Property VaultDoorConsole01 Auto

ReferenceAlias Property VaultDoorConsole02 Auto

ReferenceAlias Property VaultGearDoor Auto

RefCollectionAlias Property DisableOnOpen Auto

RefCollectionAlias Property EnableOnOpen Auto

Int Property consoleUsed Auto Hidden

Bool Property doorOpen Auto Hidden

Keyword Property KlaxonLightLink Auto

RefCollectionAlias Property EnableWhileOpen Auto

RefCollectionAlias Property EnableWhileClosed Auto

Function OpenGearDoor()
	BlockConsoles()
	ResetConsoles(false, consoleUsed)
	EffectSequence()
	VaultGearDoor.getReference().PlayAnimation("Stage2")
	self.RegisterForAnimationEvent(VaultGearDoor.getReference(), "KlaxonStop")
	doorOpen = true
EndFunction
Function CloseGearDoor()
	BlockConsoles()
	ResetConsoles(false, consoleUsed)
	EffectSequence()
	VaultGearDoor.getReference().PlayAnimation("Stage4")
	self.RegisterForAnimationEvent(VaultGearDoor.getReference(), "KlaxonStop")
	doorOpen = false
EndFunction
Function ToggleGearDoor()
	if doorOpen
		CloseGearDoor()
	else
		OpenGearDoor()
	endif
EndFunction
Event OnAnimationEvent(ObjectReference akSource, String asEventName)
	if akSource == VaultGearDoor.GetReference() && asEventName == "KlaxonStop"
		EffectSequence(false)
		ResetConsoles()
	endif
EndEvent
Function BlockConsoles(Bool blockState = true, Int consoleSelect = 0)
	if consoleSelect == 0
		VaultDoorConsole01.getReference().BlockActivation(blockState, blockState)
		VaultDoorConsole02.getReference().BlockActivation(blockState, blockState)
	elseif consoleSelect == 1
		VaultDoorConsole01.getReference().BlockActivation(blockState, blockState)
	elseif consoleSelect == 2
		VaultDoorConsole02.getReference().BlockActivation(blockState, blockState)
	endif
EndFunction
Function ResetConsoles(Bool unblock = true, Int consoleSelect = 0)
	if consoleSelect == 0
		VaultDoorConsole01.getReference().PlayAnimation("reset")
		VaultDoorConsole02.getReference().PlayAnimation("reset")
	elseif consoleSelect == 1
		VaultDoorConsole01.getReference().PlayAnimation("reset")
	elseif consoleSelect == 2
		VaultDoorConsole02.getReference().PlayAnimation("reset")
	endif
	if unblock
		BlockConsoles(false, consoleSelect)
	endif
EndFunction
Function EffectSequence(Bool bStart = true)
	Int i = 0

	While i < KlaxonLights.GetCount()
		objectreference currentKlaxon = KlaxonLights.GetAt(i)
		if bStart
			currentKlaxon.Enable(false)
			currentKlaxon.Activate(currentKlaxon)
		else
			currentKlaxon.PlayAnimation("Reset")
			currentKlaxon.GetLinkedRef(KlaxonLightLink).PlayAnimation("Reset")
			currentKlaxon.Disable(false)
		endif
		i += 1
	EndWhile
	i = 0
	While i < DisableOnOpen.GetCount()
		ObjectReference currentObj = DisableOnOpen.GetAt(i)
		if bStart
			currentObj.disable(false)
		else
			currentObj.enable(false)
		endif
		i += 1
	EndWhile
	i = 0
	While i < EnableOnOpen.GetCount()
		ObjectReference currentObj =EnableOnOpen.GetAt(i)
		if bStart
			currentObj.enable(false)
		else
			currentObj.disable(false)
		endif
		i += 1
	EndWhile
EndFunction
