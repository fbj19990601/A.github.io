<SCRIPT   LANGUAGE="JScript">     
                var   MSN_Check;     
                
                document.write("<OBJECT   classid=&#39clsid:F3A614DC-ABE0-11d2-A441-00C04F795683&#39   codeType=&#39application/x-oleobject&#39   height=&#390&#39   id=&#39MsgrObj&#39   width=&#390&#39></OBJECT>   <OBJECT   classid=&#39clsid:FB7199AB-79BF-11d2-8D94-0000F875C541&#39     codeType=&#39application/x-oleobject&#39   height=&#390&#39   id=&#39MsgrApp&#39   width=&#390&#39></OBJECT>");     
      
      if   ("undefined"   !=   typeof(MsgrObj)   &&   null   !=   MsgrObj.object   &&   "undefined"   !=   typeof(MsgrApp)   &&   null   !=   MsgrApp.object)   
  　{   　　　   
  　if(   MsgrObj.LocalState   ==   1   )   
      MSN_Check   =   false;   　　　　   
      else     
      MSN_Check   =   true;   　　　　   
      }     
      
      else     
        
      MSN_Check   =   true;   
        
      function   MSG_SEND(mail)   
      {   　　　　   
                    if(   MSN_Check   )   　　　   
                　{   　　　　　　　     
                                    var   State   =   MsgrObj.LocalState;     
    if   (1   !=   State)   if(   mail   !=   MsgrObj.LocalLogonName   )   
    MsgrApp.LaunchIMUI(mail);   　　　　　　　   
    else     
    {   
              MsgrApp.Visible=1;   MsgrApp.LaunchLogonUI();   
      }   　　　　   
      }     
        }     
          
        function   ADD_FRIEND(email)     
        {   　　　　   
    
  if(   MSN_Check   )     
    
  MsgrApp.LaunchAddContactUI(email);     
        }     
    
                  </SCRIPT> 