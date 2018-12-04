<style>
  .dropdown-submenu {
    position: relative;
  }

  .dropdown-submenu .dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: -1px;
  }

  .topnav {
    overflow: hidden;
    color: #f7728b;
    border-bottom: 2px #f7728b solid;
  }

  .topnav a {
    float: left;
    color: #f7728b;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 15px;
    font-weight:bold;
  }

  .topnav a:hover {
    background-color: #ddd;
    text-decoration-color:#c268c3 ; 
    color: black;
  }

  .topnav a.active {
    background-color: #c268c3;
    color: white;
  }
  .pre-header {
    color: #616b76;
    border-bottom: 1px solid #eee;
    padding-top: 5px;
    line-height: 1.2;
    font-family: 'Open Sans', sans-serif;
    font-weight: 300;
    background: #fff;
  }
  body {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
  }
  .navbar {
    margin-bottom: 0px;
  } 
  ul {
    margin-top: 0;
    margin-bottom: 5px;
  }
  #changeopacity{
    z-index :1200;
    margin:2px -70px 0;
  }
  #dropdown{
    color:#f1f6ff;
    font-size:12px;
    font-weight:bold;
  }
  #changecolor{
    color:#f1f6ff;
    font-weight:bold;
    font-size:12px;
  }
  #colordrp{
    color:#f1f6ff;
    font-weight:bold;
    font-size:12px;
  }
  .topbar
  {
    background-color: #f7728b;
  }
  ul.nav li.dropdown a {
    z-index: 1000;
    display: block;
  }
  header .navbar-collapse ul.navbar-nav {
    float: left;
    margin-left: 0px;
  }
  .navbar-default .navbar-nav>li>a{
    font-weight:bold;
  }

  .navbar-default .navbar-nav>li>a {
    color: #ca3232;
  }
  .navbar{
     box-shadow: 3px 3px 5px #3f51b5c7;
     background: linear-gradient(#ffeb3b4f 0,rgba(33, 150, 243, 0.2) 100%);
  }
</style>
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a href="#"><img class="pull-left" src="<?php echo base_url();?>assets/images/retailware_logo.png" style="width:150px;height:50px;margin-left: 5%;margin-bottom: 5px;margin-top: 5px; margin-right: 35px;" /></a>
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar" style="margin-top: 1%;">
      <ul class="nav navbar-nav" style="font-size: 17px;">
        <li> 
          <a href="dashboard"><span class="glyphicon glyphicon-home"></span> Dashboard</a>
        </li>
        <?php if(!empty($MainMenu))
        {
          foreach($MainMenu as $Menu)
          {
            foreach($Menu as $pullmenu)
            { ?>
              <li>
                <a
                <?php 
                $childitems=array();
                foreach($SubMenu as $SMenu)
                {
                  foreach($SMenu as $spullmenu)
                  {
                    if($spullmenu->ParentProcessID==$pullmenu->ProcessId)
                    {
                      $childitems[]=$spullmenu->ParentProcessID;
                    }
                  }
                }
                if(sizeof($childitems)>=1)
                {?>
                  data-toggle="dropdown"> <?php 
                  echo $pullmenu->Name; 
                ?>
                  <span class="caret"></span></a>
                <?PHP
                }
                else
                { ?>
                  href="<?php echo $pullmenu->Name; ?>"><?php echo $pullmenu->Name; ?></a>
                  <?php 
                }
                if(!empty($SubMenu))
                {
                  $i=0;
                  $childdata=[];
                  foreach($SubMenu as $SMenu)
                  {
                    foreach($SMenu as $spullmenu)
                    {
                      if($spullmenu->ParentProcessID==$pullmenu->ProcessId)
                      {
                        $childdata[$i]=$spullmenu->Name;
                        $i++;
                      }
                    }
                  }
                  if(sizeof($childdata)>=1)
                  { 
                    $items=sizeof($childdata);
                    $a=0;?>
                    <ul class="dropdown-menu">
                    <?php
                    for($a=0; $a < $items; $a++) 
                    { 
                      ?>
                      
                        <li>
                          <a role="button" href="<?php echo $childdata[$a]; ?>"><?php echo $childdata[$a]; ?></a>
                        </li>
                      <?php
                    }?>
                    </ul>
                    <?php
                  }
                }?>
              </li>
        <?php
            }
          }
        }?>
      </ul>
      <a href="logout"><span style="font-size: 25px;position: absolute;top:1.5%;right:20px;" title="logout" class="btn glyphicon glyphicon-off"></span></a>
    </div>
  </div>
</nav>
<script>
  $(document).ready(function(){
    $('.dropdown-submenu a.test').on("click", function(e)
    {
      $(this).next('ul').toggle();
      e.stopPropagation();
      e.preventDefault();
    });
  });
  
</script>