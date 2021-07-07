<?php
if(count($argv) < 4){
	echo 'Too few arguments' . PHP_EOL;
	exit(1);
}

$script = '';

$iterator = new RecursiveDirectoryIterator($argv[1], FilesystemIterator::SKIP_DOTS);
$iterator = new RecursiveIteratorIterator($iterator, RecursiveIteratorIterator::CHILD_FIRST);
foreach($iterator as $value){
	$path = str_replace($argv[1] . DIRECTORY_SEPARATOR, '', $value->getPathname());
	$windowsPath = str_replace(DIRECTORY_SEPARATOR, '\\', $path);
	if($value->isFile()){
		$script .= "Delete \"\$INSTDIR\\$windowsPath\"" . PHP_EOL;
	}elseif($value->isDir()){
		$script .= "RMDir \"\$INSTDIR\\$windowsPath\"" . PHP_EOL;
	}
}

$script = rtrim($script);
$origin = file_get_contents($argv[2]);
$new = str_replace('by Actions.', 'by Actions.' . PHP_EOL . $script, $origin);
file_put_contents($argv[3], $new);