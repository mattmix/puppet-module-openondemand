# nginx_stage.yml namespace_config
type Openondemand::Nginx_stage_namespace_config = Struct[{
  'dev' => Optional[String],
  'usr' => Optional[String],
  'sys' => Optional[String]
  }]
