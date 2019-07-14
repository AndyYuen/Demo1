[condition][]Open Bracket =(
[condition][]Close Bracket =)
[condition][]AND =and
[condition][]OR =or
[condition][]NOT =not
[condition][]Device {$switch}: {site}-{assetType}-{asset_id}-{attribute} is {num}={$switch} : Switch( site == "{site}", assetType == "{assetType}", asset_id == {asset_id}, attribute == "{attribute}", value == toBoolean({num}) )
[condition][]There is an alert identified as {$alert} with description {description}={$alert} : Alert(description == "{description}")
[condition][]There is no alert with description {description}=not Alert(description == "{description}")
[consequence][]Log name of this rule=System.out.println("Executed Rule: " + drools.getRule().getName() );
[consequence][]Raise alert {description}=insert( new Alert(true, "{description}" ));
[consequence][]Remove alert identified as {$alert}=retract( {$alert} );
