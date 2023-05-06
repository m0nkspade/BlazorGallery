﻿

#region using statements

using BlazorStyled;
using DataJuggler.Blazor.FileUpload;
using DataJuggler.Cryptography;
using DataJuggler.UltimateHelper;
using Microsoft.AspNetCore.Components.Server.ProtectedBrowserStorage;

#endregion

namespace DataJuggler.BlazorGallery.Pages
{

    #region class Index
    /// <summary>
    /// This class is the main page of this app.
    /// </summary>
    public partial class Index
    {
        
        #region Private Variables
        public const int UploadLimit = 20480000;
        public const string FileTooLargeMessage = "The file must be 20 megs or less.";
        private string blueButton;
        private string resetButton;
        #endregion

        #region Methods

            #region OnAfterRenderAsync(bool firstRender)
            /// <summary>
            /// This method is used to verify a user
            /// </summary>
            /// <param name="firstRender"></param>
            /// <returns></returns>
            protected async override Task OnAfterRenderAsync(bool firstRender)
            {
                

                // call the base
                await base.OnAfterRenderAsync(firstRender);

                //// if the value for HasLoggedInUser is true
                //if ((HasLoggedInUser) && (firstRender))
                //{
                //    // Refresh the UI
                //    Refresh();
                //}
            }
            #endregion

            #region OnFileUploaded(UploadedFileInfo file)
            /// <summary>
            /// This method On File Uploaded
            /// </summary>
            public void OnFileUploaded(UploadedFileInfo file)
            {
                // if the file was uploaded
                if (!file.Aborted)
                {
                   // To Do: Save the uploaded file
                   string fileName = file.Name;

                   // auto reset
                   OnReset();                   
                }
                else
                {
                    // for debugging only
                    if (file.HasException)
                    {
                        // for debugging only
                        string message = file.Exception.Message;
                    }
                }
            }
            #endregion

            #region OnReset()
            /// <summary>
            /// On Reset
            /// </summary>
            public void OnReset()
            {
                
            }
            #endregion
            
        #endregion

        #region Properties

            #region BlueButton
            /// <summary>
            /// This property gets or sets the value for 'BlueButton'.
            /// </summary>
            public string BlueButton
            {
                get { return blueButton; }
                set { blueButton = value; }
            }
            #endregion
            
            #region ResetButton
            /// <summary>
            /// This property gets or sets the value for 'ResetButton'.
            /// </summary>
            public string ResetButton
            {
                get { return resetButton; }
                set { resetButton = value; }
            }
            #endregion
            
        #endregion
        
    }
    #endregion

}
