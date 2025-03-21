local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local extras = require("luasnip.extras")
local rep = extras.rep


local foamBlockMesh = function()
    local snippets = {}
    table.insert(snippets, s("v0",
        { t("("), i(1), t({")", ""}, i(0))
            }))

    --Add Edge
    table.insert(snippets, s("ae",
        {
            t("\tarc "), i(1), t(" ("), i(2), t({")", ""}), i(0)
        }))

    --Add block
    table.insert(snippets, s("ab",
        {
            t("hex ("), i(1), t(") ("), i(2), t(") "), c(3, {t("simpleGrading"), t("edgeGrading")}), t(" ("), i(4), t({")", ""}), i(0)
        }))

    --Add boundary
    table.insert(snippets, s("aby",
        {
            t("\t"), i(1), t({"", ""}),
            t({"\t{",""}),
            t({"\t\ttype\t"}), c(2, {t("wall"), t("patch"), t("symmetry")}), t({";",""}),
            t({"\t\tfaces"}), t({"", ""}),
            t({"\t\t("}), t({"", ""}),
            t({"\t\t\t("}), i(3), t(")"), t({"", ""}),
            t({"\t\t)"}), t({";",""}),
            t({"\t}", ""}), i(0)
        }))

    --Default patch
    table.insert(snippets, s("dp",
        {
            t("defaultPatch"),
            t({"","{",""}),
            t({"\tname\t"}), i(1), t({";",""}),
            t({"\ttype\t"}), c(2, {t("wall"), t("empty")}), t({";",""}),
            t({"}", ""}), i(0)
        }))
    
    return snippets
end


local foamSnappyHexMeshDict = function()
    local snippets = {}

    --Geometry - triSurfaceMesh
    table.insert(snippets, s("tsm",
    {
        t("\t"),i(1),t({"",""}),
        t({"\t{",""}),
        t({"\t\ttype\ttriSurfaceMesh;"}), t({"",""}),
        t("\t\tfile\t\""), i(2), t({"\";"}), t({"", ""}),
        t({"\t}",""}), i(0)
    }))

    --Geometry - searchableCylinder
    table.insert(snippets, s("scyl",
    {
        t("\t"),i(1),t({"",""}),
        t({"\t{",""}),
        t({"\t\ttype\t"}), t("searchableCylinder;"), t({"",""}),
        t("\t\tpoint1\t("), i(2), t(")"), t({";",""}),
        t("\t\tpoint2\t("), i(3), t(")"), t({";",""}),
        t("\t\tradius\t"), i(4), t({";",""}),
        t({"\t}",""}), i(0)
    }))

    --Add features
    table.insert(snippets, s("af",
    {
        t("\t{"), t({"", ""}),
        t("\t\tfile\t\""), i(1), t(".eMesh\";"), t({"",""}),
        t("\t\tlevel\t"), i(2), t({";", ""}),
        t("\t}"), t({"",""}), i(0)
    }))

    --Add refinement surface
    table.insert(snippets, s("rs",
    {
        t("\t"), i(1), t({"",""}),
        t({"\t{", ""}),
        t("\t\tlevel\t("), i(2), t(")"), t({";",""}),
        t("\t\tfaceZone\t"), i(3), t({";",""}),
        t("\t\tcellZone\t"), i(4), t({";",""}),
        t("\t\tpatchInfo"), t({"",""}),
        t({"\t\t{", ""}),
        t("\t\t\ttype\t"), c(5, {t("wall"), t("patch"), t("empty")}), t({";", ""}),
        t({"\t\t}", ""}),
        t({"\t}", ""}), i(0)
    }))

    --Add refinement regions
    table.insert(snippets, s("rr",
    {
        t("\t"), i(1), t({"", ""}),
        t({"\t{", ""}),
        t("\t\tlevel\t"), i(2), t({";",""}),
        t("\t\tmode\t"), c(3, {t("inside"), t("outside")}), t({";",""}),
        t({"\t}", ""}), i(0)
    }))

    --Add layers
    table.insert(snippets, s("al",
    {
        t("\t"), i(1), t({"", ""}),
        t({"\t{", ""}),
        t("\t\tnSurfaceLayers\t"), i(2), t({";",""}),
        t("\t\texpansionRatio\t"), i(3), t({";",""}),
        t("\t\tfinalLayerThickness\t"), i(4), t({";",""}),
        t("\t\tminThickness\t"), i(5), t({";",""}),
        t({"\t}", ""}), i(0)
    }))

    return snippets
end

local foamU = function()
    local snippets = {}

    --General Boundary
    table.insert(snippets, s("bdry",
    {
        t("\t"), i(1), t({"", ""}),
        t({"\t{", ""}),
        t("\t\ttype\t"), i(2), t({"", ""}),
        t({"\t}", ""}), i(0)

    }))

    
    -- inletOutlet BC + pressureInletOutlet
    table.insert(snippets, s("inout",
    {
        c(1, {t("inletOutlet"), t("pressureInletOutletVelocity")}), t({";",""}),
        t("inletValue\tuniform ("), i(2), t(")"), t({";",""}),
        t("value\tuniform ("), i(3), t(");")
    }))

    -- Slip, noSlip, MRFnoSlip, zeroGradient, empty
    table.insert(snippets, s("sw",
    {
        c(1, {
            t("noSlip"),
            t("empty"),
            t("slip"),
            t("MRFnoSlip"),
            t("symmetryPlane"),
            t("symmetry"),
            t("zeroGradient"),
            }),t(";")
    }))

    -- Rotating Wall BC
    table.insert(snippets, s("rotW",
    {
        t("rotatingWallVelocity"), t({";", ""}),
        t("origin\t("), i(1), t(")"), t({";",""}),
        t("axis\t("), i(2), t(")"), t({";",""}),
        t("omega\t"), i(3), t(" [rpm]"), t({";"}),
    }))

    -- Fixed value BC
    table.insert(snippets, s("fvmw",
    {
        c(1, {
                t("fixedValue"), 
                t("movingWallVelocity"),
                t("movingWallSlipVelocity"),
                t("movingWallMappedVelocity"),
             }),
        t({";",""}),
        t("value\tuniform ("), i(2), t(");")
    }))

    return snippets
end

local foamMomentumTransport = function()
    local snippets = {}

    -- Turbulence models
    table.insert(snippets, s("ras",
    {
        c(1, {
                t("buoyantKEpsilon"),
                t("kEpsilon"),
                t("kkLOmega"),
                t("kOmegaSST"),
                t("kOmegaSSTLM"),
                t("LaunderSharmaKE"),
                t("PDRkEpsilon"),
                t("realizableKE"),
                t("SpalartAllmaras")
        }),
        t(";")
    }))

    return snippets
end


local set_specific_snip = function()
    local fn = vim.fn.expand('%:t:r')

    if fn == "blockMeshDict" then
        local bm = foamBlockMesh()
        ls.add_snippets("foam", bm)

    elseif fn == "snappyHexMeshDict" then
        local shm = foamSnappyHexMeshDict()
        ls.add_snippets("foam", shm)

    elseif fn == "U" then
        local u = foamU()
        ls.add_snippets("foam", u)

    elseif fn == "momentumTransport" then
        local mt = foamMomentumTransport()
        ls.add_snippets("foam", mt)
    end
end

-- Autocommand to set snippets when particular buffer in entered
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = set_specific_snip
})
