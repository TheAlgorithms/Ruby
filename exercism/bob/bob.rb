class Bob
  def hey(remark)
    return 'Fine. Be that way!' if remark.match(/\w/)==nil
    return 'Whoa, chill out!' if  remark.tr("^a-zA-Z"," ").match(/\p{Lower}/)==nil && remark.tr("^a-zA-Z"," ").squeeze!=' '
    return 'Sure.' if remark.split(//).last=='?'
     return 'Whatever.' 
  end	
end