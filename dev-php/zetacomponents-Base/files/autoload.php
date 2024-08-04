<?php
// @codingStandardsIgnoreFile
// @codeCoverageIgnoreStart
// this is an autogenerated file - do not edit
spl_autoload_register(
    function($class) {
        static $classes = null;
        if ($classes === null) {
            $classes = array(
                'ezcbase' => '/base.php',
                'ezcbaseautoloadexception' => '/exceptions/autoload.php',
                'ezcbaseautoloadoptions' => '/options/autoload.php',
                'ezcbaseconfigurationinitializer' => '/interfaces/configuration_initializer.php',
                'ezcbasedoubleclassrepositoryprefixexception' => '/exceptions/double_class_repository_prefix.php',
                'ezcbaseexception' => '/exceptions/exception.php',
                'ezcbaseexportable' => '/interfaces/exportable.php',
                'ezcbaseextensionnotfoundexception' => '/exceptions/extension_not_found.php',
                'ezcbasefeatures' => '/features.php',
                'ezcbasefile' => '/file.php',
                'ezcbasefileexception' => '/exceptions/file_exception.php',
                'ezcbasefilefindcontext' => '/structs/file_find_context.php',
                'ezcbasefileioexception' => '/exceptions/file_io.php',
                'ezcbasefilenotfoundexception' => '/exceptions/file_not_found.php',
                'ezcbasefilepermissionexception' => '/exceptions/file_permission.php',
                'ezcbasefunctionalitynotsupportedexception' => '/exceptions/functionality_not_supported.php',
                'ezcbaseinit' => '/init.php',
                'ezcbaseinitcallbackconfiguredexception' => '/exceptions/init_callback_configured.php',
                'ezcbaseinitinvalidcallbackclassexception' => '/exceptions/invalid_callback_class.php',
                'ezcbaseinvalidparentclassexception' => '/exceptions/invalid_parent_class.php',
                'ezcbasemetadata' => '/metadata.php',
                'ezcbasemetadatapearreader' => '/metadata/pear.php',
                'ezcbasemetadatatarballreader' => '/metadata/tarball.php',
                'ezcbaseoptions' => '/options.php',
                'ezcbasepersistable' => '/interfaces/persistable.php',
                'ezcbasepropertynotfoundexception' => '/exceptions/property_not_found.php',
                'ezcbasepropertypermissionexception' => '/exceptions/property_permission.php',
                'ezcbaserepositorydirectory' => '/structs/repository_directory.php',
                'ezcbasesettingnotfoundexception' => '/exceptions/setting_not_found.php',
                'ezcbasesettingvalueexception' => '/exceptions/setting_value.php',
                'ezcbasestruct' => '/struct.php',
                'ezcbasevalueexception' => '/exceptions/value.php',
                'ezcbasewhateverexception' => '/exceptions/whatever.php'
            );
        }
        $cn = strtolower($class);
        if (isset($classes[$cn])) {
            require __DIR__ . $classes[$cn];
        }
    },
    true,
    false
);
// @codeCoverageIgnoreEnd
