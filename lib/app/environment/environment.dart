import 'base_config.dart';
import 'dev_config.dart';
import 'production_config.dart';
import 'stage_config.dart';

class Environment  {
factory Environment(){
return _singleton;
}
Environment._internal();

static final Environment _singleton = Environment._internal();

static const String DEVELOPMENT = 'development';
static const String STAGING = 'staging';
static const String PRODUCTION = 'production';


BaseConfig baseConfig = DevConfig();

initConfig(String environment){
  baseConfig = _getConfig(environment);
}


BaseConfig _getConfig(String environment){
  switch(environment){
    case Environment.PRODUCTION:
    return ProductionConfig();
    case Environment.STAGING:
    return StageConfig();
    default: 
    return DevConfig();

  }

}

}