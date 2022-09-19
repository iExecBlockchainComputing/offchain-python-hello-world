@Library('global-jenkins-library@2.1.1') _

buildInfo = getBuildInfo()

baseDir = 'offchain-computing'
def nativeImage = buildSimpleDocker_v2(
        buildInfo: buildInfo,
        dockerfileDir: baseDir,
        dockerImageRepositoryName: 'offchain-python-hello-world',
        imageprivacy: 'public'
)

buildSimpleDocker_v3(
        buildInfo: buildInfo,
        dockerfileDir: baseDir + '/gramine',
        buildContext: baseDir,
        dockerImageRepositoryName: 'tee-gramine-offchain-python-hello-world',
        visibility: 'iex.ec'
)

sconeBuildUnlocked(
        nativeImage: nativeImage,
        imageName: 'offchain-python-hello-world',
        imageTag: buildInfo.imageTag,
        sconifyArgsPath: baseDir + '/sconify.args',
        sconifyVersion: '5.7.1'
)
