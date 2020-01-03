all: objects/libbase.a objects/libktx.a examples/computeheadless/computeheadless examples/radialblur/radialblur examples/descriptorsets/descriptorsets examples/offscreen/offscreen examples/computecullandlod/computecullandlod examples/dynamicuniformbuffer/dynamicuniformbuffer examples/multiview/multiview examples/computeshader/computeshader examples/texture/texture examples/texturearray/texturearray examples/geometryshader/geometryshader examples/sphericalenvmapping/sphericalenvmapping examples/parallaxmapping/parallaxmapping examples/triangle/triangle examples/subpasses/subpasses examples/pushdescriptors/pushdescriptors examples/displacement/displacement examples/textoverlay/textoverlay examples/renderheadless/renderheadless examples/terraintessellation/terraintessellation examples/occlusionquery/occlusionquery examples/shadowmapping/shadowmapping examples/pbrtexture/main examples/instancing/instancing examples/imgui/main examples/hdr/hdr examples/particlefire/particlefire examples/ssao/ssao examples/descriptorindexing/descriptorindexing examples/specializationconstants/specializationconstants examples/inputattachments/inputattachments examples/deferredmultisampling/deferredmultisampling examples/shadowmappingcascade/shadowmappingcascade examples/nv_ray_tracing_basic/nv_ray_tracing_basic examples/conditionalrender/conditionalrender examples/bloom/bloom examples/multisampling/multisampling examples/screenshot/screenshot examples/conservativeraster/conservativeraster examples/negativeviewportheight/negativeviewportheight examples/inlineuniformblocks/inlineuniformblocks examples/texturesparseresidency/texturesparseresidency examples/pipelinestatistics/pipelinestatistics examples/pbrbasic/pbrbasic examples/viewportarray/viewportarray examples/stencilbuffer/stencilbuffer examples/deferredshadows/deferredshadows examples/tessellation/tessellation examples/skeletalanimation/skeletalanimation examples/computeraytracing/computeraytracing examples/shadowmappingomni/shadowmappingomni examples/distancefieldfonts/distancefieldfonts examples/texture3d/texture3d examples/texturemipmapgen/texturemipmapgen examples/multithreading/multithreading examples/pipelines/pipelines examples/scenerendering/scenerendering examples/nv_ray_tracing_reflections/nv_ray_tracing_reflections examples/mesh/mesh examples/vulkanscene/vulkanscene examples/nv_ray_tracing_shadows/nv_ray_tracing_shadows examples/pbribl/pbribl examples/computeparticles/computeparticles examples/pushconstants/pushconstants examples/texturecubemap/texturecubemap examples/indirectdraw/indirectdraw examples/computenbody/computenbody examples/computecloth/computecloth examples/deferred/deferred examples/debugmarker/debugmarker examples/gears/gears

# troublesome: computeheadless, commandbuffers
# extensions: conservative_raster, nv_ray_tracing_basic, nv_ray_tracing_reflections, nv_ray_tracing_shadows
# other errors: inputattachments
# segfault: skeletalanimation
# feature not supported: texturesparseresidency
# file missing: descriptorindexing, imgui, pbrtexture, renderheadless, scenerendering

clean:
	rm -f objects/*.o objects/base/*.o objects/ktx/*.o
	rm -f objects/libbase.a objects/libktx.a examples/computeheadless/computeheadless examples/radialblur/radialblur examples/descriptorsets/descriptorsets examples/offscreen/offscreen examples/computecullandlod/computecullandlod examples/dynamicuniformbuffer/dynamicuniformbuffer examples/multiview/multiview examples/computeshader/computeshader examples/texture/texture examples/texturearray/texturearray examples/geometryshader/geometryshader examples/sphericalenvmapping/sphericalenvmapping examples/parallaxmapping/parallaxmapping examples/triangle/triangle examples/subpasses/subpasses examples/pushdescriptors/pushdescriptors examples/displacement/displacement examples/textoverlay/textoverlay examples/renderheadless/renderheadless examples/terraintessellation/terraintessellation examples/occlusionquery/occlusionquery examples/shadowmapping/shadowmapping examples/pbrtexture/main examples/instancing/instancing examples/imgui/main examples/hdr/hdr examples/particlefire/particlefire examples/ssao/ssao examples/descriptorindexing/descriptorindexing examples/specializationconstants/specializationconstants examples/inputattachments/inputattachments examples/deferredmultisampling/deferredmultisampling examples/shadowmappingcascade/shadowmappingcascade examples/nv_ray_tracing_basic/nv_ray_tracing_basic examples/conditionalrender/conditionalrender examples/bloom/bloom examples/multisampling/multisampling examples/screenshot/screenshot examples/conservativeraster/conservativeraster examples/negativeviewportheight/negativeviewportheight examples/inlineuniformblocks/inlineuniformblocks examples/texturesparseresidency/texturesparseresidency examples/pipelinestatistics/pipelinestatistics examples/pbrbasic/pbrbasic examples/viewportarray/viewportarray examples/stencilbuffer/stencilbuffer examples/deferredshadows/deferredshadows examples/tessellation/tessellation examples/skeletalanimation/skeletalanimation examples/computeraytracing/computeraytracing examples/shadowmappingomni/shadowmappingomni examples/distancefieldfonts/distancefieldfonts examples/texture3d/texture3d examples/texturemipmapgen/texturemipmapgen examples/multithreading/multithreading examples/pipelines/pipelines examples/scenerendering/scenerendering examples/nv_ray_tracing_reflections/nv_ray_tracing_reflections examples/mesh/mesh examples/vulkanscene/vulkanscene examples/nv_ray_tracing_shadows/nv_ray_tracing_shadows examples/pbribl/pbribl examples/computeparticles/computeparticles examples/pushconstants/pushconstants examples/texturecubemap/texturecubemap examples/indirectdraw/indirectdraw examples/computenbody/computenbody examples/computecloth/computecloth examples/deferred/deferred examples/debugmarker/debugmarker examples/gears/gears
	rm -f examples/*/imgui.ini

objects/libbase.a: objects/base/imgui.o objects/base/imgui_demo.o objects/base/imgui_draw.o objects/base/VulkanAndroid.o objects/base/VulkanDebug.o objects/base/VulkanTools.o objects/base/VulkanUIOverlay.o objects/base/vulkanexamplebase.o objects/base/imgui_widgets.o
	ar qc objects/libbase.a objects/base/imgui.o objects/base/imgui_demo.o objects/base/imgui_draw.o objects/base/imgui_widgets.o objects/base/VulkanAndroid.o objects/base/VulkanDebug.o objects/base/VulkanTools.o objects/base/VulkanUIOverlay.o objects/base/vulkanexamplebase.o
	ranlib objects/libbase.a

objects/base/imgui.o: external/imgui/imgui.cpp
	c++ -DVK_EXAMPLE_DATA_DIR=\"/home/ruben/Vulkan/data/\" -D_CRT_SECURE_NO_WARNINGS -I/home/ruben/Vulkan/external -I/home/ruben/Vulkan/external/glm -I/home/ruben/Vulkan/external/gli -I/home/ruben/Vulkan/external/assimp -I/home/ruben/Vulkan/external/imgui -I/home/ruben/Vulkan/external/tinygltf -I/home/ruben/Vulkan/base -I/home/ruben/Vulkan/external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include  -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/base/imgui.o -c external/imgui/imgui.cpp

objects/base/imgui_demo.o: external/imgui/imgui_demo.cpp
	c++ -DVK_EXAMPLE_DATA_DIR=\"/home/ruben/Vulkan/data/\" -D_CRT_SECURE_NO_WARNINGS -I/home/ruben/Vulkan/external -I/home/ruben/Vulkan/external/glm -I/home/ruben/Vulkan/external/gli -I/home/ruben/Vulkan/external/assimp -I/home/ruben/Vulkan/external/imgui -I/home/ruben/Vulkan/external/tinygltf -I/home/ruben/Vulkan/base -I/home/ruben/Vulkan/external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include  -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/base/imgui_demo.o -c external/imgui/imgui_demo.cpp

objects/base/imgui_draw.o: external/imgui/imgui_draw.cpp
	c++ -DVK_EXAMPLE_DATA_DIR=\"/home/ruben/Vulkan/data/\" -D_CRT_SECURE_NO_WARNINGS -I/home/ruben/Vulkan/external -I/home/ruben/Vulkan/external/glm -I/home/ruben/Vulkan/external/gli -I/home/ruben/Vulkan/external/assimp -I/home/ruben/Vulkan/external/imgui -I/home/ruben/Vulkan/external/tinygltf -I/home/ruben/Vulkan/base -I/home/ruben/Vulkan/external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include  -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/base/imgui_draw.o -c external/imgui/imgui_draw.cpp

objects/base/imgui_widgets.o: external/imgui/imgui_widgets.cpp
	c++ -DVK_EXAMPLE_DATA_DIR=\"/home/ruben/Vulkan/data/\" -D_CRT_SECURE_NO_WARNINGS -I/home/ruben/Vulkan/external -I/home/ruben/Vulkan/external/glm -I/home/ruben/Vulkan/external/gli -I/home/ruben/Vulkan/external/assimp -I/home/ruben/Vulkan/external/imgui -I/home/ruben/Vulkan/external/tinygltf -I/home/ruben/Vulkan/base -I/home/ruben/Vulkan/external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include  -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/base/imgui_widgets.o -c external/imgui/imgui_widgets.cpp

objects/base/VulkanAndroid.o: base/VulkanAndroid.cpp
	c++ -DVK_EXAMPLE_DATA_DIR=\"/home/ruben/Vulkan/data/\" -D_CRT_SECURE_NO_WARNINGS -I/home/ruben/Vulkan/external -I/home/ruben/Vulkan/external/glm -I/home/ruben/Vulkan/external/gli -I/home/ruben/Vulkan/external/assimp -I/home/ruben/Vulkan/external/imgui -I/home/ruben/Vulkan/external/tinygltf -I/home/ruben/Vulkan/base -I/home/ruben/Vulkan/external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include  -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/base/VulkanAndroid.o -c base/VulkanAndroid.cpp

objects/base/VulkanDebug.o: base/VulkanDebug.cpp
	c++ -DVK_EXAMPLE_DATA_DIR=\"/home/ruben/Vulkan/data/\" -D_CRT_SECURE_NO_WARNINGS -I/home/ruben/Vulkan/external -I/home/ruben/Vulkan/external/glm -I/home/ruben/Vulkan/external/gli -I/home/ruben/Vulkan/external/assimp -I/home/ruben/Vulkan/external/imgui -I/home/ruben/Vulkan/external/tinygltf -I/home/ruben/Vulkan/base -I/home/ruben/Vulkan/external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include  -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/base/VulkanDebug.o -c base/VulkanDebug.cpp

objects/base/VulkanTools.o: base/VulkanTools.cpp
	c++ -DVK_EXAMPLE_DATA_DIR=\"/home/ruben/Vulkan/data/\" -D_CRT_SECURE_NO_WARNINGS -I/home/ruben/Vulkan/external -I/home/ruben/Vulkan/external/glm -I/home/ruben/Vulkan/external/gli -I/home/ruben/Vulkan/external/assimp -I/home/ruben/Vulkan/external/imgui -I/home/ruben/Vulkan/external/tinygltf -I/home/ruben/Vulkan/base -I/home/ruben/Vulkan/external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include  -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/base/VulkanTools.o -c base/VulkanTools.cpp

objects/base/VulkanUIOverlay.o: base/VulkanUIOverlay.cpp
	c++ -DVK_EXAMPLE_DATA_DIR=\"/home/ruben/Vulkan/data/\" -D_CRT_SECURE_NO_WARNINGS -I/home/ruben/Vulkan/external -I/home/ruben/Vulkan/external/glm -I/home/ruben/Vulkan/external/gli -I/home/ruben/Vulkan/external/assimp -I/home/ruben/Vulkan/external/imgui -I/home/ruben/Vulkan/external/tinygltf -I/home/ruben/Vulkan/base -I/home/ruben/Vulkan/external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include  -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/base/VulkanUIOverlay.o -c base/VulkanUIOverlay.cpp

objects/base/vulkanexamplebase.o: base/vulkanexamplebase.cpp
	c++ -DVK_EXAMPLE_DATA_DIR=\"/home/ruben/Vulkan/data/\" -D_CRT_SECURE_NO_WARNINGS -I/home/ruben/Vulkan/external -I/home/ruben/Vulkan/external/glm -I/home/ruben/Vulkan/external/gli -I/home/ruben/Vulkan/external/assimp -I/home/ruben/Vulkan/external/imgui -I/home/ruben/Vulkan/external/tinygltf -I/home/ruben/Vulkan/base -I/home/ruben/Vulkan/external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include  -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/base/vulkanexamplebase.o -c base/vulkanexamplebase.cpp


objects/libktx.a: objects/ktx/texture.o objects/ktx/hashlist.o objects/ktx/checkheader.o objects/ktx/swap.o objects/ktx/memstream.o objects/ktx/filestream.o
	ar qc objects/libktx.a objects/ktx/texture.o objects/ktx/hashlist.o objects/ktx/checkheader.o objects/ktx/swap.o objects/ktx/memstream.o objects/ktx/filestream.o
	ranlib objects/libktx.a

objects/ktx/texture.o:
	cc -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include -o objects/ktx/texture.o -c external/ktx/lib/texture.c

objects/ktx/hashlist.o:
	cc -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include -o objects/ktx/hashlist.o -c external/ktx/lib/hashlist.c

objects/ktx/checkheader.o:
	cc -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include -o objects/ktx/checkheader.o -c external/ktx/lib/checkheader.c

objects/ktx/swap.o:
	cc -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include -o objects/ktx/swap.o -c external/ktx/lib/swap.c

objects/ktx/memstream.o:
	cc -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include -o objects/ktx/memstream.o -c external/ktx/lib/memstream.c

objects/ktx/filestream.o:
	cc -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I/home/ruben/Vulkan/external/ktx/lib -I/home/ruben/Vulkan/external/ktx/other_include -o objects/ktx/filestream.o -c external/ktx/lib/filestream.c


objects/computeheadless.o: examples/computeheadless/computeheadless.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/computeheadless.o -c examples/computeheadless/computeheadless.cpp

examples/computeheadless/computeheadless: objects/libbase.a objects/libktx.a objects/computeheadless.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/computeheadless.o  -o examples/computeheadless/computeheadless -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/radialblur.o: examples/radialblur/radialblur.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/radialblur.o -c examples/radialblur/radialblur.cpp

examples/radialblur/radialblur: objects/libbase.a objects/libktx.a objects/radialblur.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/radialblur.o  -o examples/radialblur/radialblur -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/descriptorsets.o: examples/descriptorsets/descriptorsets.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/descriptorsets.o -c examples/descriptorsets/descriptorsets.cpp

examples/descriptorsets/descriptorsets: objects/libbase.a objects/libktx.a objects/descriptorsets.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/descriptorsets.o  -o examples/descriptorsets/descriptorsets -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/commandbuffers.o: examples/commandbuffers/commandbuffers.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/commandbuffers.o -c examples/commandbuffers/commandbuffers.cpp

examples/commandbuffers/commandbuffers: objects/libbase.a objects/libktx.a objects/commandbuffers.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/commandbuffers.o  -o examples/commandbuffers/commandbuffers -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/offscreen.o: examples/offscreen/offscreen.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/offscreen.o -c examples/offscreen/offscreen.cpp

examples/offscreen/offscreen: objects/libbase.a objects/libktx.a objects/offscreen.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/offscreen.o  -o examples/offscreen/offscreen -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/computecullandlod.o: examples/computecullandlod/computecullandlod.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/computecullandlod.o -c examples/computecullandlod/computecullandlod.cpp

examples/computecullandlod/computecullandlod: objects/libbase.a objects/libktx.a objects/computecullandlod.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/computecullandlod.o  -o examples/computecullandlod/computecullandlod -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/dynamicuniformbuffer.o: examples/dynamicuniformbuffer/dynamicuniformbuffer.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/dynamicuniformbuffer.o -c examples/dynamicuniformbuffer/dynamicuniformbuffer.cpp

examples/dynamicuniformbuffer/dynamicuniformbuffer: objects/libbase.a objects/libktx.a objects/dynamicuniformbuffer.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/dynamicuniformbuffer.o  -o examples/dynamicuniformbuffer/dynamicuniformbuffer -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/multiview.o: examples/multiview/multiview.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/multiview.o -c examples/multiview/multiview.cpp

examples/multiview/multiview: objects/libbase.a objects/libktx.a objects/multiview.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/multiview.o  -o examples/multiview/multiview -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/computeshader.o: examples/computeshader/computeshader.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/computeshader.o -c examples/computeshader/computeshader.cpp

examples/computeshader/computeshader: objects/libbase.a objects/libktx.a objects/computeshader.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/computeshader.o  -o examples/computeshader/computeshader -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/texture.o: examples/texture/texture.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/texture.o -c examples/texture/texture.cpp

examples/texture/texture: objects/libbase.a objects/libktx.a objects/texture.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/texture.o  -o examples/texture/texture -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/texturearray.o: examples/texturearray/texturearray.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/texturearray.o -c examples/texturearray/texturearray.cpp

examples/texturearray/texturearray: objects/libbase.a objects/libktx.a objects/texturearray.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/texturearray.o  -o examples/texturearray/texturearray -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/geometryshader.o: examples/geometryshader/geometryshader.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/geometryshader.o -c examples/geometryshader/geometryshader.cpp

examples/geometryshader/geometryshader: objects/libbase.a objects/libktx.a objects/geometryshader.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/geometryshader.o  -o examples/geometryshader/geometryshader -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/sphericalenvmapping.o: examples/sphericalenvmapping/sphericalenvmapping.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/sphericalenvmapping.o -c examples/sphericalenvmapping/sphericalenvmapping.cpp

examples/sphericalenvmapping/sphericalenvmapping: objects/libbase.a objects/libktx.a objects/sphericalenvmapping.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/sphericalenvmapping.o  -o examples/sphericalenvmapping/sphericalenvmapping -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/parallaxmapping.o: examples/parallaxmapping/parallaxmapping.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/parallaxmapping.o -c examples/parallaxmapping/parallaxmapping.cpp

examples/parallaxmapping/parallaxmapping: objects/libbase.a objects/libktx.a objects/parallaxmapping.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/parallaxmapping.o  -o examples/parallaxmapping/parallaxmapping -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/triangle.o: examples/triangle/triangle.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/triangle.o -c examples/triangle/triangle.cpp

examples/triangle/triangle: objects/libbase.a objects/libktx.a objects/triangle.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/triangle.o  -o examples/triangle/triangle -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/subpasses.o: examples/subpasses/subpasses.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/subpasses.o -c examples/subpasses/subpasses.cpp

examples/subpasses/subpasses: objects/libbase.a objects/libktx.a objects/subpasses.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/subpasses.o  -o examples/subpasses/subpasses -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/pushdescriptors.o: examples/pushdescriptors/pushdescriptors.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/pushdescriptors.o -c examples/pushdescriptors/pushdescriptors.cpp

examples/pushdescriptors/pushdescriptors: objects/libbase.a objects/libktx.a objects/pushdescriptors.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/pushdescriptors.o  -o examples/pushdescriptors/pushdescriptors -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/displacement.o: examples/displacement/displacement.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/displacement.o -c examples/displacement/displacement.cpp

examples/displacement/displacement: objects/libbase.a objects/libktx.a objects/displacement.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/displacement.o  -o examples/displacement/displacement -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/textoverlay.o: examples/textoverlay/textoverlay.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/textoverlay.o -c examples/textoverlay/textoverlay.cpp

examples/textoverlay/textoverlay: objects/libbase.a objects/libktx.a objects/textoverlay.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/textoverlay.o  -o examples/textoverlay/textoverlay -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/renderheadless.o: examples/renderheadless/renderheadless.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/renderheadless.o -c examples/renderheadless/renderheadless.cpp

examples/renderheadless/renderheadless: objects/libbase.a objects/libktx.a objects/renderheadless.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/renderheadless.o  -o examples/renderheadless/renderheadless -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/terraintessellation.o: examples/terraintessellation/terraintessellation.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/terraintessellation.o -c examples/terraintessellation/terraintessellation.cpp

examples/terraintessellation/terraintessellation: objects/libbase.a objects/libktx.a objects/terraintessellation.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/terraintessellation.o  -o examples/terraintessellation/terraintessellation -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/occlusionquery.o: examples/occlusionquery/occlusionquery.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/occlusionquery.o -c examples/occlusionquery/occlusionquery.cpp

examples/occlusionquery/occlusionquery: objects/libbase.a objects/libktx.a objects/occlusionquery.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/occlusionquery.o  -o examples/occlusionquery/occlusionquery -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/shadowmapping.o: examples/shadowmapping/shadowmapping.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/shadowmapping.o -c examples/shadowmapping/shadowmapping.cpp

examples/shadowmapping/shadowmapping: objects/libbase.a objects/libktx.a objects/shadowmapping.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/shadowmapping.o  -o examples/shadowmapping/shadowmapping -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/pbrtexture.o: examples/pbrtexture/main.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/main.o -c examples/pbrtexture/main.cpp

examples/pbrtexture/main: objects/libbase.a objects/libktx.a objects/main.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/main.o  -o examples/pbrtexture/main -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/instancing.o: examples/instancing/instancing.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/instancing.o -c examples/instancing/instancing.cpp

examples/instancing/instancing: objects/libbase.a objects/libktx.a objects/instancing.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/instancing.o  -o examples/instancing/instancing -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/main.o: examples/imgui/main.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/main.o -c examples/imgui/main.cpp

examples/imgui/main: objects/libbase.a objects/libktx.a objects/main.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/main.o  -o examples/imgui/main -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/hdr.o: examples/hdr/hdr.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/hdr.o -c examples/hdr/hdr.cpp

examples/hdr/hdr: objects/libbase.a objects/libktx.a objects/hdr.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/hdr.o  -o examples/hdr/hdr -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/particlefire.o: examples/particlefire/particlefire.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/particlefire.o -c examples/particlefire/particlefire.cpp

examples/particlefire/particlefire: objects/libbase.a objects/libktx.a objects/particlefire.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/particlefire.o  -o examples/particlefire/particlefire -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/ssao.o: examples/ssao/ssao.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/ssao.o -c examples/ssao/ssao.cpp

examples/ssao/ssao: objects/libbase.a objects/libktx.a objects/ssao.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/ssao.o  -o examples/ssao/ssao -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/descriptorindexing.o: examples/descriptorindexing/descriptorindexing.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/descriptorindexing.o -c examples/descriptorindexing/descriptorindexing.cpp

examples/descriptorindexing/descriptorindexing: objects/libbase.a objects/libktx.a objects/descriptorindexing.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/descriptorindexing.o  -o examples/descriptorindexing/descriptorindexing -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/specializationconstants.o: examples/specializationconstants/specializationconstants.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/specializationconstants.o -c examples/specializationconstants/specializationconstants.cpp

examples/specializationconstants/specializationconstants: objects/libbase.a objects/libktx.a objects/specializationconstants.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/specializationconstants.o  -o examples/specializationconstants/specializationconstants -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/inputattachments.o: examples/inputattachments/inputattachments.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/inputattachments.o -c examples/inputattachments/inputattachments.cpp

examples/inputattachments/inputattachments: objects/libbase.a objects/libktx.a objects/inputattachments.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/inputattachments.o  -o examples/inputattachments/inputattachments -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/deferredmultisampling.o: examples/deferredmultisampling/deferredmultisampling.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/deferredmultisampling.o -c examples/deferredmultisampling/deferredmultisampling.cpp

examples/deferredmultisampling/deferredmultisampling: objects/libbase.a objects/libktx.a objects/deferredmultisampling.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/deferredmultisampling.o  -o examples/deferredmultisampling/deferredmultisampling -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/shadowmappingcascade.o: examples/shadowmappingcascade/shadowmappingcascade.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/shadowmappingcascade.o -c examples/shadowmappingcascade/shadowmappingcascade.cpp

examples/shadowmappingcascade/shadowmappingcascade: objects/libbase.a objects/libktx.a objects/shadowmappingcascade.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/shadowmappingcascade.o  -o examples/shadowmappingcascade/shadowmappingcascade -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/nv_ray_tracing_basic.o: examples/nv_ray_tracing_basic/nv_ray_tracing_basic.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/nv_ray_tracing_basic.o -c examples/nv_ray_tracing_basic/nv_ray_tracing_basic.cpp

examples/nv_ray_tracing_basic/nv_ray_tracing_basic: objects/libbase.a objects/libktx.a objects/nv_ray_tracing_basic.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/nv_ray_tracing_basic.o  -o examples/nv_ray_tracing_basic/nv_ray_tracing_basic -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/conditionalrender.o: examples/conditionalrender/conditionalrender.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/conditionalrender.o -c examples/conditionalrender/conditionalrender.cpp

examples/conditionalrender/conditionalrender: objects/libbase.a objects/libktx.a objects/conditionalrender.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/conditionalrender.o  -o examples/conditionalrender/conditionalrender -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/bloom.o: examples/bloom/bloom.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/bloom.o -c examples/bloom/bloom.cpp

examples/bloom/bloom: objects/libbase.a objects/libktx.a objects/bloom.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/bloom.o  -o examples/bloom/bloom -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/multisampling.o: examples/multisampling/multisampling.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/multisampling.o -c examples/multisampling/multisampling.cpp

examples/multisampling/multisampling: objects/libbase.a objects/libktx.a objects/multisampling.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/multisampling.o  -o examples/multisampling/multisampling -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/screenshot.o: examples/screenshot/screenshot.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/screenshot.o -c examples/screenshot/screenshot.cpp

examples/screenshot/screenshot: objects/libbase.a objects/libktx.a objects/screenshot.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/screenshot.o  -o examples/screenshot/screenshot -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/conservativeraster.o: examples/conservativeraster/conservativeraster.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/conservativeraster.o -c examples/conservativeraster/conservativeraster.cpp

examples/conservativeraster/conservativeraster: objects/libbase.a objects/libktx.a objects/conservativeraster.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/conservativeraster.o  -o examples/conservativeraster/conservativeraster -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/negativeviewportheight.o: examples/negativeviewportheight/negativeviewportheight.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/negativeviewportheight.o -c examples/negativeviewportheight/negativeviewportheight.cpp

examples/negativeviewportheight/negativeviewportheight: objects/libbase.a objects/libktx.a objects/negativeviewportheight.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/negativeviewportheight.o  -o examples/negativeviewportheight/negativeviewportheight -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/inlineuniformblocks.o: examples/inlineuniformblocks/inlineuniformblocks.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/inlineuniformblocks.o -c examples/inlineuniformblocks/inlineuniformblocks.cpp

examples/inlineuniformblocks/inlineuniformblocks: objects/libbase.a objects/libktx.a objects/inlineuniformblocks.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/inlineuniformblocks.o  -o examples/inlineuniformblocks/inlineuniformblocks -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/texturesparseresidency.o: examples/texturesparseresidency/texturesparseresidency.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/texturesparseresidency.o -c examples/texturesparseresidency/texturesparseresidency.cpp

examples/texturesparseresidency/texturesparseresidency: objects/libbase.a objects/libktx.a objects/texturesparseresidency.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/texturesparseresidency.o  -o examples/texturesparseresidency/texturesparseresidency -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/pipelinestatistics.o: examples/pipelinestatistics/pipelinestatistics.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/pipelinestatistics.o -c examples/pipelinestatistics/pipelinestatistics.cpp

examples/pipelinestatistics/pipelinestatistics: objects/libbase.a objects/libktx.a objects/pipelinestatistics.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/pipelinestatistics.o  -o examples/pipelinestatistics/pipelinestatistics -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/pbrbasic.o: examples/pbrbasic/pbrbasic.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/pbrbasic.o -c examples/pbrbasic/pbrbasic.cpp

examples/pbrbasic/pbrbasic: objects/libbase.a objects/libktx.a objects/pbrbasic.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/pbrbasic.o  -o examples/pbrbasic/pbrbasic -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/viewportarray.o: examples/viewportarray/viewportarray.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/viewportarray.o -c examples/viewportarray/viewportarray.cpp

examples/viewportarray/viewportarray: objects/libbase.a objects/libktx.a objects/viewportarray.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/viewportarray.o  -o examples/viewportarray/viewportarray -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/stencilbuffer.o: examples/stencilbuffer/stencilbuffer.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/stencilbuffer.o -c examples/stencilbuffer/stencilbuffer.cpp

examples/stencilbuffer/stencilbuffer: objects/libbase.a objects/libktx.a objects/stencilbuffer.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/stencilbuffer.o  -o examples/stencilbuffer/stencilbuffer -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/deferredshadows.o: examples/deferredshadows/deferredshadows.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/deferredshadows.o -c examples/deferredshadows/deferredshadows.cpp

examples/deferredshadows/deferredshadows: objects/libbase.a objects/libktx.a objects/deferredshadows.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/deferredshadows.o  -o examples/deferredshadows/deferredshadows -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/tessellation.o: examples/tessellation/tessellation.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/tessellation.o -c examples/tessellation/tessellation.cpp

examples/tessellation/tessellation: objects/libbase.a objects/libktx.a objects/tessellation.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/tessellation.o  -o examples/tessellation/tessellation -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/skeletalanimation.o: examples/skeletalanimation/skeletalanimation.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/skeletalanimation.o -c examples/skeletalanimation/skeletalanimation.cpp

examples/skeletalanimation/skeletalanimation: objects/libbase.a objects/libktx.a objects/skeletalanimation.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/skeletalanimation.o  -o examples/skeletalanimation/skeletalanimation -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/computeraytracing.o: examples/computeraytracing/computeraytracing.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/computeraytracing.o -c examples/computeraytracing/computeraytracing.cpp

examples/computeraytracing/computeraytracing: objects/libbase.a objects/libktx.a objects/computeraytracing.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/computeraytracing.o  -o examples/computeraytracing/computeraytracing -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/shadowmappingomni.o: examples/shadowmappingomni/shadowmappingomni.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/shadowmappingomni.o -c examples/shadowmappingomni/shadowmappingomni.cpp

examples/shadowmappingomni/shadowmappingomni: objects/libbase.a objects/libktx.a objects/shadowmappingomni.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/shadowmappingomni.o  -o examples/shadowmappingomni/shadowmappingomni -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/distancefieldfonts.o: examples/distancefieldfonts/distancefieldfonts.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/distancefieldfonts.o -c examples/distancefieldfonts/distancefieldfonts.cpp

examples/distancefieldfonts/distancefieldfonts: objects/libbase.a objects/libktx.a objects/distancefieldfonts.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/distancefieldfonts.o  -o examples/distancefieldfonts/distancefieldfonts -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/texture3d.o: examples/texture3d/texture3d.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/texture3d.o -c examples/texture3d/texture3d.cpp

examples/texture3d/texture3d: objects/libbase.a objects/libktx.a objects/texture3d.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/texture3d.o  -o examples/texture3d/texture3d -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/texturemipmapgen.o: examples/texturemipmapgen/texturemipmapgen.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/texturemipmapgen.o -c examples/texturemipmapgen/texturemipmapgen.cpp

examples/texturemipmapgen/texturemipmapgen: objects/libbase.a objects/libktx.a objects/texturemipmapgen.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/texturemipmapgen.o  -o examples/texturemipmapgen/texturemipmapgen -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/multithreading.o: examples/multithreading/multithreading.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/multithreading.o -c examples/multithreading/multithreading.cpp

examples/multithreading/multithreading: objects/libbase.a objects/libktx.a objects/multithreading.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/multithreading.o  -o examples/multithreading/multithreading -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/pipelines.o: examples/pipelines/pipelines.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/pipelines.o -c examples/pipelines/pipelines.cpp

examples/pipelines/pipelines: objects/libbase.a objects/libktx.a objects/pipelines.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/pipelines.o  -o examples/pipelines/pipelines -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/scenerendering.o: examples/scenerendering/scenerendering.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/scenerendering.o -c examples/scenerendering/scenerendering.cpp

examples/scenerendering/scenerendering: objects/libbase.a objects/libktx.a objects/scenerendering.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/scenerendering.o  -o examples/scenerendering/scenerendering -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/nv_ray_tracing_reflections.o: examples/nv_ray_tracing_reflections/nv_ray_tracing_reflections.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/nv_ray_tracing_reflections.o -c examples/nv_ray_tracing_reflections/nv_ray_tracing_reflections.cpp

examples/nv_ray_tracing_reflections/nv_ray_tracing_reflections: objects/libbase.a objects/libktx.a objects/nv_ray_tracing_reflections.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/nv_ray_tracing_reflections.o  -o examples/nv_ray_tracing_reflections/nv_ray_tracing_reflections -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/mesh.o: examples/mesh/mesh.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/mesh.o -c examples/mesh/mesh.cpp

examples/mesh/mesh: objects/libbase.a objects/libktx.a objects/mesh.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/mesh.o  -o examples/mesh/mesh -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/vulkanscene.o: examples/vulkanscene/vulkanscene.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/vulkanscene.o -c examples/vulkanscene/vulkanscene.cpp

examples/vulkanscene/vulkanscene: objects/libbase.a objects/libktx.a objects/vulkanscene.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/vulkanscene.o  -o examples/vulkanscene/vulkanscene -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/nv_ray_tracing_shadows.o: examples/nv_ray_tracing_shadows/nv_ray_tracing_shadows.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/nv_ray_tracing_shadows.o -c examples/nv_ray_tracing_shadows/nv_ray_tracing_shadows.cpp

examples/nv_ray_tracing_shadows/nv_ray_tracing_shadows: objects/libbase.a objects/libktx.a objects/nv_ray_tracing_shadows.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/nv_ray_tracing_shadows.o  -o examples/nv_ray_tracing_shadows/nv_ray_tracing_shadows -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/pbribl.o: examples/pbribl/pbribl.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/pbribl.o -c examples/pbribl/pbribl.cpp

examples/pbribl/pbribl: objects/libbase.a objects/libktx.a objects/pbribl.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/pbribl.o  -o examples/pbribl/pbribl -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/computeparticles.o: examples/computeparticles/computeparticles.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/computeparticles.o -c examples/computeparticles/computeparticles.cpp

examples/computeparticles/computeparticles: objects/libbase.a objects/libktx.a objects/computeparticles.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/computeparticles.o  -o examples/computeparticles/computeparticles -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/pushconstants.o: examples/pushconstants/pushconstants.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/pushconstants.o -c examples/pushconstants/pushconstants.cpp

examples/pushconstants/pushconstants: objects/libbase.a objects/libktx.a objects/pushconstants.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/pushconstants.o  -o examples/pushconstants/pushconstants -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/texturecubemap.o: examples/texturecubemap/texturecubemap.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/texturecubemap.o -c examples/texturecubemap/texturecubemap.cpp

examples/texturecubemap/texturecubemap: objects/libbase.a objects/libktx.a objects/texturecubemap.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/texturecubemap.o  -o examples/texturecubemap/texturecubemap -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/indirectdraw.o: examples/indirectdraw/indirectdraw.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/indirectdraw.o -c examples/indirectdraw/indirectdraw.cpp

examples/indirectdraw/indirectdraw: objects/libbase.a objects/libktx.a objects/indirectdraw.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/indirectdraw.o  -o examples/indirectdraw/indirectdraw -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/computenbody.o: examples/computenbody/computenbody.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/computenbody.o -c examples/computenbody/computenbody.cpp

examples/computenbody/computenbody: objects/libbase.a objects/libktx.a objects/computenbody.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/computenbody.o  -o examples/computenbody/computenbody -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/computecloth.o: examples/computecloth/computecloth.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/computecloth.o -c examples/computecloth/computecloth.cpp

examples/computecloth/computecloth: objects/libbase.a objects/libktx.a objects/computecloth.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/computecloth.o  -o examples/computecloth/computecloth -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/deferred.o: examples/deferred/deferred.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/deferred.o -c examples/deferred/deferred.cpp

examples/deferred/deferred: objects/libbase.a objects/libktx.a objects/deferred.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/deferred.o  -o examples/deferred/deferred -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/debugmarker.o: examples/debugmarker/debugmarker.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/debugmarker.o -c examples/debugmarker/debugmarker.cpp

examples/debugmarker/debugmarker: objects/libbase.a objects/libktx.a objects/debugmarker.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/debugmarker.o  -o examples/debugmarker/debugmarker -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread

objects/gears.o: examples/gears/gears.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/gears.o -c examples/gears/gears.cpp

objects/vulkangear.o: examples/gears/vulkangear.cpp
	c++  -DVK_EXAMPLE_DATA_DIR=data -D_CRT_SECURE_NO_WARNINGS -I external -I external/glm -I external/gli -I external/assimp -I external/imgui -I external/tinygltf -I base -I external/ktx/include -I external/ktx/lib -I external/ktx/other_include -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -o objects/vulkangear.o -c examples/gears/vulkangear.cpp

examples/gears/gears: objects/libbase.a objects/libktx.a objects/gears.o objects/vulkangear.o
	c++ -DVK_USE_PLATFORM_XCB_KHR -DNOMINMAX -D_USE_MATH_DEFINES -std=c++11 -rdynamic objects/gears.o objects/vulkangear.o -o examples/gears/gears -lxcb -lvulkan -lvulkan -lassimp -lpthread objects/libbase.a objects/libktx.a -lxcb -lvulkan -lassimp -lpthread
