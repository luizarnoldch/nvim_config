# Neovim Configuration

Este README documenta la configuración de Neovim basada en Lua, incluyendo plugins para completado, formato de código, gestión de snippets, soporte para Go, y más.

## Plugins Principales

### 1. [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
Un framework de completado automático que incluye soporte para múltiples fuentes.

#### Dependencias:
- `hrsh7th/cmp-nvim-lsp`
- `hrsh7th/cmp-buffer`
- `hrsh7th/cmp-path`
- `saadparwaiz1/cmp_luasnip`
- `L3MON4D3/LuaSnip`
- `mlaursen/vim-react-snippets` (Snippets para React)

#### Configuración:
- Configuración personalizada de mapeos, snippets y fuentes de completado.
- Uso de snippets con LuaSnip.
- Soporte para autocompletado de React.

### 2. [formatter.nvim](https://github.com/mhartington/formatter.nvim)
Un plugin para formatear el código automáticamente.

#### Formateadores configurados:
- **Lua**: Stylua.
- **JavaScript/TypeScript (y React)**: Prettier.

#### Formateo al guardar:
Se utiliza un autocomando para aplicar el formato automáticamente al guardar archivos.

### 3. [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
Muestra indicadores de cambios en Git directamente en el editor.

#### Características:
- Indicadores de líneas modificadas.
- Opciones para interactuar con Git dentro de Neovim.

### 4. [go.nvim](https://github.com/ray-x/go.nvim)
Un plugin específico para el desarrollo en Go.

#### Funcionalidades:
- Integración con `gopls`.
- Uso de `goimports` antes de guardar.
- Comandos para instalar/actualizar binarios.

#### Dependencias opcionales:
- `ray-x/guihua.lua`
- `neovim/nvim-lspconfig`
- `nvim-treesitter/nvim-treesitter`

### 5. [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
Muestra líneas verticales para indicar niveles de indentación.

#### Configuración:
- Carácter de indentación personalizado (`│`).
- Visualización mejorada del alcance del código.

## Instalación

### Requisitos previos:
- **Neovim** >= 0.8.
- Un gestor de plugins como [packer.nvim](https://github.com/wbthomason/packer.nvim).

### Ejemplo de configuración con `packer.nvim`:
```lua
return require('packer').startup(function()
  use 'hrsh7th/nvim-cmp'
  use 'mhartington/formatter.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'ray-x/go.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
end)
```

## Uso

### Completado con `nvim-cmp`
- **`<C-Space>`**: Mostrar completado.
- **`<CR>`**: Confirmar selección.
- **`<Tab>`/`<S-Tab>`**: Navegar entre opciones o snippets.

### Formateo de archivos
El formato se aplica automáticamente al guardar archivos Lua, JavaScript, TypeScript y React. También puedes ejecutarlo manualmente con:
```vim
:FormatWrite
```

### Soporte para Go
- Guarda archivos Go para aplicar `goimports` automáticamente.
- Usa `:lua require("go.install").update_all_sync()` para instalar o actualizar binarios relacionados con Go.

## Personalización
Puedes ajustar la configuración modificando los archivos Lua relacionados según tus necesidades.

## Contribuciones
Se aceptan contribuciones para mejorar la configuración. Por favor, abre un issue o un pull request en el repositorio.

## Licencia
Este proyecto se distribuye bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.
