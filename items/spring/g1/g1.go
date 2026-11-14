components {
  id: "spring"
  component: "/items/spring/spring.script"
  properties {
    id: "force"
    value: "450.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "angle"
    value: "65.0"
    type: PROPERTY_TYPE_NUMBER
  }
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  ""
}
