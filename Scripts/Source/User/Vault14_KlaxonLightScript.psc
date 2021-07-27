Scriptname Vault14_KlaxonLightScript extends RefCollectionAlias
Keyword Property KlaxonLightLink Auto
Event OnActivate(ObjectReference sender, ObjectReference action)
	sender.PlayAnimation("Stage2")
	sender.GetLinkedRef(KlaxonLightLink).PlayAnimation("Stage2")
EndEvent