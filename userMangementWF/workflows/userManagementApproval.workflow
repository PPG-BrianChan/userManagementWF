{
	"contents": {
		"4b4380ae-261e-45e3-9290-c03b56325b9d": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "usermanagementapproval",
			"subject": "userManagementApproval",
			"name": "userManagementApproval",
			"documentation": "Approval process for user management - unlock ID",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"73d92523-4f1f-49ce-80c2-ceeb15ce9697": {
					"name": "approvalStep"
				},
				"aaba9859-b1d7-43b0-b016-519e3f43f050": {
					"name": "isApproved"
				},
				"44b0ea67-68ac-48ef-9794-14fa36fe2ed3": {
					"name": "approvalScript"
				},
				"3e688086-cbf3-405b-a2ea-6e452f8f5e43": {
					"name": "sendMail"
				}
			},
			"sequenceFlows": {
				"349d767d-97b7-41a2-85c8-6beea6f5a42f": {
					"name": "SequenceFlow2"
				},
				"62814c4d-7c2c-4e33-9783-6c47468e5520": {
					"name": "SequenceFlow3"
				},
				"27354761-7218-495d-9866-71f0f7ab63b0": {
					"name": "rejected"
				},
				"1afa6a97-ec6c-4880-87d1-6378f6718d8a": {
					"name": "approved"
				},
				"febf4b40-9392-40f2-8ef5-1820b01cb22e": {
					"name": "SequenceFlow10"
				},
				"47aeb808-6747-419e-9c47-c1cc181a6d14": {
					"name": "SequenceFlow12"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"73d92523-4f1f-49ce-80c2-ceeb15ce9697": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approval for Ticket No: ${context.approvalrequest.ticketno}",
			"description": "Requesting for your kind approval to unlock user ID with details below.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/userManagementApproval/approvalForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approvalform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "approvalStep"
		},
		"aaba9859-b1d7-43b0-b016-519e3f43f050": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "isApproved",
			"default": "27354761-7218-495d-9866-71f0f7ab63b0"
		},
		"44b0ea67-68ac-48ef-9794-14fa36fe2ed3": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/userManagementApproval/approval.js",
			"id": "scripttask1",
			"name": "approvalScript"
		},
		"3e688086-cbf3-405b-a2ea-6e452f8f5e43": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Mail_Service",
			"path": "/api",
			"httpMethod": "POST",
			"requestVariable": "${context.mailrequest}",
			"responseVariable": "${context.response}",
			"id": "servicetask3",
			"name": "sendMail"
		},
		"349d767d-97b7-41a2-85c8-6beea6f5a42f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "73d92523-4f1f-49ce-80c2-ceeb15ce9697"
		},
		"62814c4d-7c2c-4e33-9783-6c47468e5520": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "73d92523-4f1f-49ce-80c2-ceeb15ce9697",
			"targetRef": "aaba9859-b1d7-43b0-b016-519e3f43f050"
		},
		"27354761-7218-495d-9866-71f0f7ab63b0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "rejected",
			"sourceRef": "aaba9859-b1d7-43b0-b016-519e3f43f050",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"1afa6a97-ec6c-4880-87d1-6378f6718d8a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision==\"yes\"}",
			"id": "sequenceflow7",
			"name": "approved",
			"sourceRef": "aaba9859-b1d7-43b0-b016-519e3f43f050",
			"targetRef": "44b0ea67-68ac-48ef-9794-14fa36fe2ed3"
		},
		"febf4b40-9392-40f2-8ef5-1820b01cb22e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "44b0ea67-68ac-48ef-9794-14fa36fe2ed3",
			"targetRef": "3e688086-cbf3-405b-a2ea-6e452f8f5e43"
		},
		"47aeb808-6747-419e-9c47-c1cc181a6d14": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "3e688086-cbf3-405b-a2ea-6e452f8f5e43",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"473f90ad-c953-4026-826f-552f1ba950fd": {},
				"ef548cb8-485d-43f4-b21c-d48882bcd3e2": {},
				"cde72958-0a31-433f-bff6-221046eda020": {},
				"e7761525-6c52-43c8-9568-76c2c996ce15": {},
				"4f988e14-cd2b-43f2-a962-590518d8ce36": {},
				"bc71b4e2-3a9d-43f0-8f98-81d306d06fc7": {},
				"ba500a92-c25b-4ad6-9aea-205eea184f19": {},
				"2e0dd9d6-910d-44d3-a24e-f18af53df13e": {},
				"28017128-bfbd-4a6d-9f77-1f68441d138b": {},
				"dc939c25-8408-420e-890c-9bdce6847274": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 26,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 596,
			"y": 24.5,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"473f90ad-c953-4026-826f-552f1ba950fd": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 94,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "73d92523-4f1f-49ce-80c2-ceeb15ce9697"
		},
		"ef548cb8-485d-43f4-b21c-d48882bcd3e2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,42 94,42",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "473f90ad-c953-4026-826f-552f1ba950fd",
			"object": "349d767d-97b7-41a2-85c8-6beea6f5a42f"
		},
		"cde72958-0a31-433f-bff6-221046eda020": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 244,
			"y": 21,
			"object": "aaba9859-b1d7-43b0-b016-519e3f43f050"
		},
		"e7761525-6c52-43c8-9568-76c2c996ce15": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,42 244,42",
			"sourceSymbol": "473f90ad-c953-4026-826f-552f1ba950fd",
			"targetSymbol": "cde72958-0a31-433f-bff6-221046eda020",
			"object": "62814c4d-7c2c-4e33-9783-6c47468e5520"
		},
		"4f988e14-cd2b-43f2-a962-590518d8ce36": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "286,42 596,42",
			"sourceSymbol": "cde72958-0a31-433f-bff6-221046eda020",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "27354761-7218-495d-9866-71f0f7ab63b0"
		},
		"bc71b4e2-3a9d-43f0-8f98-81d306d06fc7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "265,42 377,42 377,261.5 518,261.5 518,181",
			"sourceSymbol": "cde72958-0a31-433f-bff6-221046eda020",
			"targetSymbol": "ba500a92-c25b-4ad6-9aea-205eea184f19",
			"object": "1afa6a97-ec6c-4880-87d1-6378f6718d8a"
		},
		"ba500a92-c25b-4ad6-9aea-205eea184f19": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 468,
			"y": 151,
			"width": 100,
			"height": 60,
			"object": "44b0ea67-68ac-48ef-9794-14fa36fe2ed3"
		},
		"2e0dd9d6-910d-44d3-a24e-f18af53df13e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "518,181 518,142.75 565.75,142.75 565.75,105",
			"sourceSymbol": "ba500a92-c25b-4ad6-9aea-205eea184f19",
			"targetSymbol": "28017128-bfbd-4a6d-9f77-1f68441d138b",
			"object": "febf4b40-9392-40f2-8ef5-1820b01cb22e"
		},
		"28017128-bfbd-4a6d-9f77-1f68441d138b": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 515.75,
			"y": 75,
			"width": 100,
			"height": 60,
			"object": "3e688086-cbf3-405b-a2ea-6e452f8f5e43"
		},
		"dc939c25-8408-420e-890c-9bdce6847274": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "565.75,105 565.75,67 613.5,67 613.5,42",
			"sourceSymbol": "28017128-bfbd-4a6d-9f77-1f68441d138b",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "47aeb808-6747-419e-9c47-c1cc181a6d14"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 12,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 3,
			"scripttask": 2,
			"exclusivegateway": 1
		}
	}
}