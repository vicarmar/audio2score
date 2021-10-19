from setuptools import setup, find_packages

setup(name='audio2score',
      version='0.1',
      description='Audio2Score - Automatic Music Transcription',
      url='http://github.com/vicarmar/audio2score',
      author='Víctor Arroyo, Miguel Ángel Román',
      author_email='vicarmar@hotmail.com',
      license='MIT',
      packages=find_packages('src'),
      package_dir={'': 'src'},
      entry_points={  # Optional
            'console_scripts': [
                  'a2s-train=audio2score.train:main',
                  'a2s-train-multigpu=audio2score.train:main_multi_gpu',
                  'a2s-test=audio2score.test:main',
                  'a2s-combine-dataset=audio2score.tools.combine_dataset:main',
                  'a2s-showmodel=audio2score.tools.showmodel:main',
                  'a2s-transcribe=audio2score.tools.transcribe:main',
                  'a2s-prepare=audio2score.tools.prepare:main',
                  'a2s-prepare-sonatas=audio2score.tools.prepare:main',
                  'a2s-prepare-quartets=audio2score.tools.prepare:main_quartets',
            ],
      },
      zip_safe=False)