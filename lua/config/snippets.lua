local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local extras = require("luasnip.extras")
local rep = extras.rep

-- Map for LuaSnip
-- local ls = require("luasnip")
-- vim.keymap.set({ "i", "s" }, "<C-l>", function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end)
-- vim.keymap.set({ "i", "s" }, "<C-h>", function()
--   if ls.choice_active() then
--  ls.change_choice(-1)
--  end
-- end)

-- Define snippets for LaTeX
ls.add_snippets("tex", {
    -- Snippet for \begin{}...\end{}
    s("beg", {
        t("\\begin{"), i(1), t("}"),
        t({"","\t"}), i(0),  -- Line break and place for user to type inside the environment
        t({"", "\\end{"}), rep(1), t("}"),
    }),
})

-- Define snippets for OpenFOAM files
-- Extract only the file name
local file_name = vim.fn.expand("%:t")

-- Table to store snippets
local snippets = {}

if file_name == "controlDict" then
    table.insert(snippets, s("st", { t("startTime\t\t"), i(0) }))
    table.insert(snippets, s("et", { t("endTime\t\t"), i(0) }))
    table.insert(snippets, s("sf", { t("startFrom\t\t"), c(1, {t("startTime"), t("latestTime")})}))
elseif file_name == "fvSchemes" then
    table.insert(snippets, s("ds", { t("divSchemes\t\t"), i(0) }))
    table.insert(snippets, s("is", { t("interpolationSchemes\t\t"), i(0) }))
elseif file_name == "fvSolution" then
    table.insert(snippets, s("sol", { t("solvers\t\t"), i(0) }))
    table.insert(snippets, s("rel", { t("relaxationFactors\t\t"), i(0) }))
end

-- Add snippets only if there are any
if #snippets > 0 then
    ls.add_snippets("foam", snippets)
end
