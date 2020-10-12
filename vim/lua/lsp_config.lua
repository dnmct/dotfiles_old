local on_attach_vim = function(client)
    require'completion'.on_attach(client)
end

require'nvim_lsp'.tsserver.setup{on_attach=on_attach_vim}
