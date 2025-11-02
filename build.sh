set -ex

cd iperf3

./configure --prefix=$(pwd)/output
make -j $(nproc)
make install
cp /bin/cygwin1.dll output/bin/
cp /bin/cygcrypto-3.dll output/bin/
cp /bin/cygz.dll output/bin/
cp /bin/cyggcc_s*.dll output/bin/
cp /bin/cygstdc++-6.dll output/bin/

echo "RELEASE_TAG=${IPERF_REPO}-${IPERF_REVISION}-$(git rev-parse --short HEAD)" >> $GITHUB_ENV