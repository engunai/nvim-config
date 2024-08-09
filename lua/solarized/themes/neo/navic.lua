return function(c)
  local utils = require('solarized.utils')
  local set_hl = utils.set_hl

  set_hl('NavicIconsFile', { fg = c.base00 })
  set_hl('NavicIconsModule', { link = '@namespace' })
  set_hl('NavicIconsNamespace', { link = '@namespace' })
  set_hl('NavicIconsPackage', { link = 'Directory' })
  set_hl('NavicIconsClass', { link = 'Type' })
  set_hl('NavicIconsMethod', { link = 'Type' })
  set_hl('NavicIconsProperty', { link = '@field' })
  set_hl('NavicIconsField', { link = '@field' })
  set_hl('NavicIconsConstructor', { link = '@constructor' })
  set_hl('NavicIconsEnum', { link = 'Type' })
  set_hl('NavicIconsInterface', { link = 'Type' })
  set_hl('NavicIconsFunction', { link = 'Function' })
  set_hl('NavicIconsVariable', { link = 'Identifier' })
  set_hl('NavicIconsConstant', { link = 'Constant' })
  set_hl('NavicIconsString', { link = 'String' })
  set_hl('NavicIconsNumber', { link = 'Number' })
  set_hl('NavicIconsBoolean', { link = 'Boolean' })
  set_hl('NavicIconsArray', { link = 'Delimiter' })
  set_hl('NavicIconsObject', { link = '@field' })
  set_hl('NavicIconsKey', { link = '@field' })
  set_hl('NavicIconsNull', { link = 'Constant' })
  set_hl('NavicIconsEnumMember', { link = 'Constant' })
  set_hl('NavicIconsStruct', { link = 'Structure' })
  set_hl('NavicIconsEvent', { fg = c.base2 })
  set_hl('NavicIconsOperator', { link = 'Operator' })
  set_hl('NavicIconsTypeParameter', { link = '@parameter' })
  set_hl('NavicText', { fg = c.base1 })
  set_hl('NavicSeparator', { link = 'Keyword' })
end
