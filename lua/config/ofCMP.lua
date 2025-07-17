local source = {}

function source:is_available()
  return true
end

function source:get_trigger_characters()
  return { ' ', '\n' }
end

-- ✨ Dictionary for controlDict
local function controlDict_completions()
  -- List of all applications
  local applications = {
    "acousticFoam", "adjointOptimisationFoam", "adjointShapeOptimizationFoam", "blockMesh",
    "boundaryFoam", "buoyantBoussinesqPimpleFoam", "buoyantBoussinesqSimpleFoam",
    "buoyantPimpleFoam", "buoyantSimpleFoam", "cavitatingFoam", "checkMesh", "chemFoam",
    "chtMultiRegionFoam", "chtMultiRegionSimpleFoam", "chtMultiRegionTwoPhaseEulerFoam",
    "coalChemistryFoam", "coldEngineFoam", "compressibleInterDyMFoam", "compressibleInterFoam",
    "compressibleInterIsoFoam", "compressibleMultiphaseInterFoam", "decomposePar", "dnsFoam",
    "DPMFoam", "driftFluxFoam", "dsmcFoam", "electrostaticFoam", "extrudeMesh", "financialFoam",
    "fireFoam", "foamyHexMesh", "foamyQuadMesh", "icoFoam", "icoReactingMultiphaseInterFoam",
    "icoUncoupledKinematicParcelDyMFoam", "icoUncoupledKinematicParcelFoam",
    "interCondensatingEvaporatingFoam", "interFoam", "interIsoFoam", "interMixingFoam",
    "interPhaseChangeDyMFoam", "interPhaseChangeFoam", "kinematicParcelFoam", "laplacianFoam",
    "liquidFilmFoam", "mdEquilibrationFoam", "mdFoam", "mhdFoam", "moveDynamicMesh",
    "MPPICDyMFoam", "MPPICFoam", "MPPICInterFoam", "multiphaseEulerFoam", "multiphaseInterFoam",
    "nonNewtonianIcoFoam", "overBuoyantPimpleDyMFoam", "overCompressibleInterDyMFoam",
    "overInterDyMFoam", "overInterPhaseChangeDyMFoam", "overLaplacianDyMFoam", "overPimpleDyMFoam",
    "overPotentialFoam", "overRhoPimpleDyMFoam", "overRhoSimpleFoam", "overSimpleFoam",
    "PDRblockMesh", "PDRFoam", "pimpleFoam", "pisoFoam", "porousSimpleFoam", "potentialFoam",
    "potentialFreeSurfaceDyMFoam", "potentialFreeSurfaceFoam", "reactingFoam",
    "reactingHeterogenousParcelFoam", "reactingMultiphaseEulerFoam", "reactingParcelFoam",
    "reactingTwoPhaseEulerFoam", "refineMesh", "rhoCentralFoam", "rhoPimpleAdiabaticFoam",
    "rhoPimpleFoam", "rhoPorousSimpleFoam", "rhoReactingFoam", "rhoSimpleFoam",
    "scalarTransportFoam", "shallowWaterFoam", "simpleFoam", "simpleReactingParcelFoam",
    "snappyHexMesh", "solidDisplacementFoam", "solidEquilibriumDisplacementFoam", "solidFoam",
    "sonicDyMFoam", "sonicFoam", "sonicLiquidFoam", "sphereSurfactantFoam", "sprayFoam",
    "SRFPimpleFoam", "SRFSimpleFoam", "stitchMesh", "subsetMesh", "surfactantFoam",
    "twoLiquidMixingFoam", "twoPhaseEulerFoam", "uncoupledKinematicParcelDyMFoam", "XiDyMFoam",
    "XiEngineFoam", "XiFoam",
  }

  local application_items = {}
  for _, app in ipairs(applications) do
    table.insert(application_items, {
      label = app,
      kind = vim.lsp.protocol.CompletionItemKind.Class,
    })
  end

  local start_from_items = {
    { label = "latestTime", kind = vim.lsp.protocol.CompletionItemKind.EnumMember },
    { label = "startTime", kind = vim.lsp.protocol.CompletionItemKind.EnumMember },
  }

  local write_control_items = {
    { label = "adjustable", kind = vim.lsp.protocol.CompletionItemKind.EnumMember },
    { label = "timeStep", kind = vim.lsp.protocol.CompletionItemKind.EnumMember },
    { label = "writeTime", kind = vim.lsp.protocol.CompletionItemKind.EnumMember },
    { label = "endTime", kind = vim.lsp.protocol.CompletionItemKind.EnumMember },
    { label = "runTime", kind = vim.lsp.protocol.CompletionItemKind.EnumMember },
    { label = "onEnd", kind = vim.lsp.protocol.CompletionItemKind.EnumMember },
  }

  return {
    application = application_items,
    startFrom = start_from_items,
    writeControl = write_control_items,
  }
end

-- ✨ Dictionary for U (velocity)
local function U_completions()
  return {
    type = {
      { label = "fixedValue", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "uniformFixedValue", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "zeroGradient", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "inletOutlet", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "noSlip", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "slip", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "waveVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "pressureInletOutletVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "pressureInletOutletParSlipVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "flowRateInletVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "interstitialInletVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "symmetry", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "symmetryPlane", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "adjointOutletVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "movingWallVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "empty", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "calculated", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "JohnsonJacksonParticleSlip", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "cyclicAMI", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "processor", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "freestreamVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "overset", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "velocityFilmShell", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "permeableAlphaPressureInletOutletVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "mappedFlowRate", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "fluxCorrectedVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "freeSurfaceVelocity", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
    },
    value = {
      { label = "uniform (0 0 0)", kind = vim.lsp.protocol.CompletionItemKind.Value },
      { label = "$internalField", kind = vim.lsp.protocol.CompletionItemKind.Value },
    },
    inletValue = {
      { label = "uniform (0 0 0)", kind = vim.lsp.protocol.CompletionItemKind.Value },
    },
  }
end


-- ✨ Dictionary for p (pressure)
local function p_completions()
  return {
    type = {
      { label = "fixedValue", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "zeroGradient", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "totalPressure", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "outletInlet", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "cyclic", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "fixedFluxPressure", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "calculated", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "empty", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "prghPressure", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
      { label = "symmetry", kind = vim.lsp.protocol.CompletionItemKind.TypeParameter },
    },
    value = {
      { label = "uniform (0 0 0)", kind = vim.lsp.protocol.CompletionItemKind.Value },
      { label = "$internalField", kind = vim.lsp.protocol.CompletionItemKind.Value },
    },
    inletValue = {
      { label = "uniform (0 0 0)", kind = vim.lsp.protocol.CompletionItemKind.Value },
    },
  }
end

-- 📦 Dispatcher: filename → corresponding keyword-value dictionary
local function get_dict_for_file(filepath)
  local filename = vim.fn.fnamemodify(filepath, ":t")
  if filename == "controlDict" then
    return controlDict_completions()
  elseif filename:match("^U.*") then
    return U_completions()
  elseif filename:match("p*") then
    return U_completions()
  end
  return {}
end

-- 🧠 Main complete function
function source:complete(params, callback)
  local line = params.context.cursor_before_line
  local key = string.match(line, '(%w+)%s*$')

  local dict = get_dict_for_file(vim.api.nvim_buf_get_name(0))
  local items = {}

  if key and dict[key] then
    items = dict[key]
  end

  callback({
    items = items,
    isIncomplete = false,
  })
end

return source
