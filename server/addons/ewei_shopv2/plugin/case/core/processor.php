<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
require IA_ROOT . '/addons/ewei_shopv2/defines.php';
require EWEI_SHOPV2_INC . '/plugin_processor.php';
class CaseProcessor extends PluginProcessor 
{
	public function __construct() 
	{
		parent::__construct('case');
	}
}
?>