components {
  id: "spring"
  component: "/items/static/spring/spring.script"
  properties {
    id: "force"
    value: "500.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "angle"
    value: "30.0"
    type: PROPERTY_TYPE_NUMBER
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_TRIGGER\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"item\"\n"
  "mask: \"player\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_BOX\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 3\n"
  "    id: \"1\"\n"
  "  }\n"
  "  data: 2.746884\n"
  "  data: 2.9754264\n"
  "  data: 10.0\n"
  "}\n"
  ""
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"logo_256\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "size {\n"
  "  x: 256.0\n"
  "  y: 256.0\n"
  "}\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/items/static/spring/springs.atlas\"\n"
  "}\n"
  ""
  scale {
    x: 0.05
    y: 0.05
  }
}
