using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Panda.Fun.Facts.RNPandaFunFacts
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNPandaFunFactsModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNPandaFunFactsModule"/>.
        /// </summary>
        internal RNPandaFunFactsModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNPandaFunFacts";
            }
        }
    }
}
